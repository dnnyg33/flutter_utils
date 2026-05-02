// public facing types in this file.

import 'dart:io';

class FileUtils {
  /// Resolves the consumer project root as an absolute path.
  ///
  /// Resolution order:
  ///   1. `CONSUMER_CWD` env var (set by `flutter_utils:create_wizard`).
  ///   2. Walk up from CWD looking for a `pubspec.yaml` with a top-level
  ///      `workspace:` key.
  ///
  /// [rootDir] is unused and kept only so existing callers compile.
  static String relativeToRootPathPrefix(String rootDir) {
    final consumerCwd = Platform.environment['CONSUMER_CWD'];
    if (consumerCwd != null && consumerCwd.isNotEmpty) {
      return consumerCwd;
    }

    final workspaceRoot = _findWorkspaceRoot(Directory.current);
    if (workspaceRoot != null) {
      return workspaceRoot.path;
    }

    throw StateError(
      'Could not locate project root. Set CONSUMER_CWD or run mason from '
      'inside a project containing pubspec.yaml with a workspace section.',
    );
  }

  static Directory? _findWorkspaceRoot(Directory start) {
    Directory current = start.absolute;
    while (true) {
      final pubspec = File('${current.path}/pubspec.yaml');
      if (pubspec.existsSync()) {
        final content = pubspec.readAsStringSync();
        if (RegExp(r'^workspace\s*:', multiLine: true).hasMatch(content)) {
          return current;
        }
      }
      final parent = current.parent;
      if (parent.path == current.path) return null;
      current = parent;
    }
  }

  /// Inserts content into a file after any regex matches for each line.
  static Future<void> insertAfter(String filePath, String content, RegExp regex,
      {int times = -1}) async {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    final sink = file.openWrite(mode: FileMode.write);
    int count = 0;

    for (var line in lines) {
      sink.writeln(line);
      if (regex.hasMatch(line) && (times == -1 || times > count)) {
        count++;
        sink.writeln(content);
      }
    }

    await sink.close();
  }

  /// Inserts content into a file before any regex matches for each line.
  static Future<void> insertBefore(
    String path,
    String content,
    RegExp pattern,
  ) async {
    final file = File(path);
    final lines = file.readAsLinesSync();

    final sink = file.openWrite(mode: FileMode.write);

    for (var line in lines) {
      if (pattern.hasMatch(line)) {
        sink.writeln(content);
      }
      sink.writeln(line);
    }

    await sink.close();
  }

  static Future<void> insertAlphabeticallyInYamlSection(
    String filePath,
    String content,
    RegExp sectionPattern,
  ) async {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    final sink = file.openWrite(mode: FileMode.write);

    bool inserted = false;
    bool inSection = false;
    int? sectionIndentLevel;
    int? itemIndentLevel;

    for (var line in lines) {
      // Check if we're entering the target section
      if (!inSection && sectionPattern.hasMatch(line)) {
        inSection = true;
        sectionIndentLevel = line.indexOf(line.trimLeft());
        sink.writeln(line);
        continue;
      }

      // If we're in the section
      if (inSection && !inserted) {
        if (line.trim().isNotEmpty) {
          final currentIndent = line.indexOf(line.trimLeft());

          // Check if we've left the section (line at same or lower indent)
          if (currentIndent <= sectionIndentLevel!) {
            inSection = false;
            sink.writeln(line);
            continue;
          }

          // Detect the indent level of first-level items (direct children)
          if (itemIndentLevel == null) {
            itemIndentLevel = currentIndent;
          }

          // Only compare with lines at the same indent as first-level items
          // Skip sub-properties (lines with more indentation)
          if (currentIndent == itemIndentLevel) {
            // Check if content already exists
            if (line.trim() == content.trim()) {
              inserted = true;
              sink.writeln(line);
              continue;
            }

            // Insert if content comes alphabetically before this line
            if (content.trim().compareTo(line.trim()) < 0) {
              // Ensure content has the correct indentation
              final indent = ' ' * itemIndentLevel;
              sink.writeln('$indent${content.trim()}');
              inserted = true;
            }
          }
        }
      }

      sink.writeln(line);
    }

    // Only insert at end if we're still in the section (edge case: section at EOF)
    if (inSection && !inserted && itemIndentLevel != null) {
      final indent = ' ' * itemIndentLevel;
      sink.writeln('$indent${content.trim()}');
    }

    // If section wasn't found, don't insert (as per requirements)

    await sink.close();
  }

  /// Inserts an import statement into a file alphabetically.
  static Future<void> insertImport(
    String filePath,
    String importStatement,
  ) async {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    final sink = file.openWrite(mode: FileMode.write);

    bool inserted = false;

    for (var line in lines) {
      // Only compare with other import/export statements
      if (!inserted &&
          (line.trim().startsWith('import ') ||
              line.trim().startsWith('export '))) {
        // Check if import already exists
        if (line == importStatement) {
          inserted = true; // Skip insertion, already exists
        } else if (importStatement.compareTo(line) < 0) {
          // Insert before this import
          sink.writeln(importStatement);
          inserted = true;
        }
      }

      // If we've passed all imports and haven't inserted yet
      if (!inserted &&
          line.trim().isNotEmpty &&
          !line.trim().startsWith('import ') &&
          !line.trim().startsWith('export ') &&
          !line.trim().startsWith('//') &&
          !line.trim().startsWith('/*')) {
        // Insert before first non-import line
        sink.writeln(importStatement);
        inserted = true;
      }

      sink.writeln(line);
    }

    if (!inserted) {
      sink.writeln(importStatement);
    }

    await sink.close();
  }

  static Future<void> insertAtTop(
    String filePath,
    String content,
  ) async {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    final sink = file.openWrite(mode: FileMode.write);

    sink.writeln(content);

    lines.forEach(sink.writeln);

    await sink.close();
  }

  /// Inserts content alphabetically within a function or block.
  ///
  /// Finds lines between [startPattern] and [endPattern], extracts a sort key
  /// from each line using [extractKey], and inserts [content] in alphabetical order.
  static Future<void> insertAlphabetically(
    String filePath,
    String content, {
    required RegExp startPattern,
    required RegExp endPattern,
    String Function(String)? extractKey = null,
  }) async {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    final sink = file.openWrite(mode: FileMode.write);

    bool inserted = false;
    bool inBlock = false;
    final contentKey = extractKey?.call(content) ?? content;

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];

      // Check if we're entering the target block
      if (!inBlock && startPattern.hasMatch(line)) {
        inBlock = true;
        sink.writeln(line);
        continue;
      }

      // Check if we're exiting the block
      if (inBlock && endPattern.hasMatch(line)) {
        // If we haven't inserted yet, insert before the closing brace
        if (!inserted) {
          sink.writeln(content);
          inserted = true;
        }
        inBlock = false;
        sink.writeln(line);
        continue;
      }

      // If we're in the block and haven't inserted yet
      if (inBlock && !inserted) {
        final lineKey = extractKey?.call(line) ?? line;

        // Skip empty lines and comments
        if (line.trim().isEmpty || line.trim().startsWith('//')) {
          sink.writeln(line);
          continue;
        }

        // Check if content already exists
        if (content.trim() == line.trim()) {
          inserted = true;
          sink.writeln(line);
          continue;
        }

        // Insert if content comes alphabetically before this line
        if (lineKey.isNotEmpty && contentKey.compareTo(lineKey) < 0) {
          sink.writeln(content);
          inserted = true;
        }
      }

      sink.writeln(line);
    }

    await sink.close();
  }
}
