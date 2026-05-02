import 'dart:io';
import 'package:prompts/prompts.dart' as prompts;
import 'package:recase/recase.dart';

Future<void> main(List<String> args) async {
  stdout.writeln('🔥 Welcome to the Fishbowl Creator\n');

  final flow = prompts.choose<Flow>(
    'What do you want to create?',
    Flow.values.toList(),
    names: Flow.values.map((e) => e.prefix).toList(),
  );

  if (flow == null) {
    return;
  }

  if (flow == Flow.info) {
    _printInfo();
    exit(0);
  }

  String packageName;

  if (flow == Flow.package || flow == Flow.library) {
    // For new packages, ask for the name
    packageName = prompts.get(
      'Enter new package_name',
      validate: (v) => v.trim().isNotEmpty,
    );
    await runFlow(flow, [packageName]);
    exit(0);
  } else {
    // For existing packages (feature/bloc), show a list to choose from
    final availablePackages = _getAvailablePackages();
    if (availablePackages.isEmpty) {
      stdout.writeln('❌ No packages found in packages/ directory');
      exit(1);
    }

    packageName = prompts.choose(
      'Select the package to add this to',
      availablePackages,
    ) ?? '';

    if (packageName.isEmpty) {
      stdout.writeln('❌ No package selected');
      exit(1);
    }
  }

  String? featureName;
  if (flow == Flow.feature) {
    featureName = prompts.get(
      'Enter feature_name',
      validate: (v) => v.trim().isNotEmpty,
    );
    await runFlow(flow, [featureName, packageName]);
    final blocName = featureName;
    final libSubdirectory = 'src/${ReCase(featureName).snakeCase}/bloc/';
    await runFlow(Flow.bloc, [blocName, packageName, libSubdirectory, 'false']);
    exit(0);
  }

  // For Bloc creation
  final blocName = prompts
      .get(
        'Enter bloc_name (omit "Bloc" suffix)',
        validate: (v) => v.trim().isNotEmpty,
      )
      .replaceAll(RegExp(r'Bloc$', caseSensitive: false), '');

  String libSubdirectory;
  final availableFeatures = _getAvailableFeatures(packageName);

  if (availableFeatures.isNotEmpty) {
    final useFeatureList = prompts.getBool(
      'Select from available features?',
      defaultsTo: true,
    );

    if (useFeatureList) {
      libSubdirectory = prompts.choose(
        'Select feature to add bloc to',
        [...availableFeatures, 'src/blocs/ (default)', 'Enter custom path'],
      ) ?? 'src/blocs/';

      if (libSubdirectory == 'Enter custom path') {
        libSubdirectory = prompts
            .get(
              'Enter lib_subdirectory',
              validate: (v) => v.trim().isNotEmpty,
            )
            .replaceFirst(RegExp(r'^/'), '');
      } else if (libSubdirectory == 'src/blocs/ (default)') {
        libSubdirectory = 'src/blocs/';
      }
    } else {
      libSubdirectory = prompts
          .get(
            'Enter lib_subdirectory or leave blank',
            defaultsTo: 'default: src/blocs',
          )
          .replaceFirst(RegExp(r'^/'), '');
    }
  } else {
    libSubdirectory = prompts
        .get(
          'Enter lib_subdirectory or leave blank',
          defaultsTo: 'default: src/blocs',
        )
        .replaceFirst(RegExp(r'^/'), '');
  }

  await runFlow(flow, [blocName, packageName, libSubdirectory]);
}

List<String> _getAvailablePackages() {
  final packagesDir = Directory('./packages');
  if (!packagesDir.existsSync()) {
    return [];
  }

  final packages = <String>[];
  for (final entity in packagesDir.listSync()) {
    if (entity is Directory) {
      final packageName = entity.path.split('/').last;
      // Exclude API packages
      if (!packageName.endsWith('_api')) {
        // Check if it has a pubspec.yaml
        final pubspecFile = File('${entity.path}/pubspec.yaml');
        if (pubspecFile.existsSync()) {
          packages.add(packageName);
        }
      }
    }
  }

  packages.sort();
  return packages;
}

List<String> _getAvailableFeatures(String packageName) {
  final srcDir = Directory('./packages/$packageName/lib/src');
  if (!srcDir.existsSync()) {
    return [];
  }

  final features = <String>[];
  for (final entity in srcDir.listSync()) {
    if (entity is Directory) {
      final featureName = entity.path.split('/').last;
      // Add feature subdirectory path
      features.add('src/$featureName/');
    }
  }

  features.sort();
  return features;
}

void _printInfo() {
  stdout.writeln('\nℹ️  Info:');
  stdout.writeln(
    'Package brick → creates a new feature package and API package. For example, "Login"',
  );
  stdout.writeln(
    'Feature/Screen brick → creates entry point, UI, BLoC, and navigation files within an existing feature. For example, "Forgot password"',
  );
  stdout.writeln(
    'Library Package brick → creates a new dependency package with no api package that can be depended on by any package. For example, "utils, common widgets, and theme"',
  );
  stdout.writeln(
    'BLoC brick → creates a new BLoC and supporting files within an existing feature. Runs with feature/screen usage, but can also be used separately when additional blocs are needed on a single feature."',
  );
}

Future<int> runFlow(Flow flow, List<String> args) async {
  final scriptPath = './tools/scripts/${flow.shellName}';
  stdout
      .writeln('\n🚀 Running ${flow.shellName} with args: ${args.join(' ')}\n');

  final process = await Process.start(
    'sh',
    [scriptPath, ...args],
    mode: ProcessStartMode.inheritStdio,
  );

  final exitCode = await process.exitCode;
  stdout.writeln(
    exitCode == 0
        ? '\n✅ ${flow.displayName} created successfully!\n'
        : '\n❌ ${flow.displayName} creation failed (exit $exitCode)\n',
  );
  return exitCode;
}

enum Flow {
  package('new_package.sh', 'Feature Package', 'p'),
  feature('new_feature.sh', 'Screen/Feature', 's'),
  bloc('new_bloc.sh', 'BLoC', 'b'),
  library('new_library.sh', 'Library Package', 'l'),
  info('info', 'More Info', 'i');

  final String shellName;
  final String displayName;
  final String prefix;

  const Flow(this.shellName, this.displayName, this.prefix);

  @override
  String toString() {
    return displayName;
  }
}
