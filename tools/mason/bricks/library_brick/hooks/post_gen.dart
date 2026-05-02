import 'package:file_utils/file_utils.dart';
import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) async {
  final logger = context.logger;
  final progress = logger.progress('Wiring up new library...');

  const rootDir = 'flutterbowl';
  final root = FileUtils.relativeToRootPathPrefix(rootDir);

  final String libraryName = context.vars['library_name'];
  final rc = ReCase(libraryName);

  // Add library to root pubspec workspace
  await _rootPubspec(rc.snakeCase, root);

  progress.complete(green.wrap('${rc.titleCase} library is ready!') as String);
}

_rootPubspec(String libraryName, String root) async {
  print("Adding library to root pubspec");
  final path = '$root/pubspec.yaml';
  final pattern = RegExp('^workspace');
  final content = '  - packages/$libraryName';
  await FileUtils.insertAlphabeticallyInYamlSection(path, content, pattern);
}