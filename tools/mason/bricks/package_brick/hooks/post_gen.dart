import 'dart:io';

import 'package:file_utils/file_utils.dart';
import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) async {
  const rootDir = 'flutterbowl';
  final root = FileUtils.relativeToRootPathPrefix(rootDir);

  final String packageName = context.vars['package_name'];
  final rc = ReCase(packageName);

  //code changes
  await _deploymentImpl(packageName, root, "standalone");
  await _appRouter(packageName, root);
  await _fishbowlApp(rc.snakeCase, root, 'standalone');

  //pubspec changes
  await _rootPubspec(rc.snakeCase, root);
  await _coreYaml(rc.snakeCase, root);
  await _newPackagePubspec(rc.snakeCase, root);
  await _appsYaml(rc.snakeCase, root, "standalone");
}

_newPackagePubspec(packageName, root) async {
  final path = '$root/packages/$packageName/pubspec.yaml';

  final content = '${packageName}_api:\n    path: ../${packageName}_api';
  await FileUtils.insertAlphabeticallyInYamlSection(
    path,
    content,
    RegExp('^dependencies'),
  );
}
_appRouter(packageName, String root) async {
  final rc = ReCase(packageName);
  final appRouterPath = '${root}/apps/standalone/lib/app_router.dart';

  //create reference in app router
  final routeContent = '''
    ...${rc.pascalCase}Router(path: '/${rc.camelCase}').routes,
  ''';

  final patternImpl = RegExp(
    r'List<AutoRoute> get _flutterRoutes => \[',
  );
  final endPattern = RegExp(r'\];');

  await FileUtils.insertAlphabetically(
    appRouterPath,
    routeContent,
    startPattern: patternImpl,
    endPattern: endPattern,
  );

  final importStatement = "import 'package:${rc.snakeCase}/${rc.snakeCase}.dart';";
  await FileUtils.insertImport(appRouterPath, importStatement);
}


_rootPubspec(String packageName, String root) async {
  print("Adding to root pubspec");
  final path = '$root/pubspec.yaml';
  final pattern = RegExp('^workspace');
  final content = '- packages/${packageName}\n  - packages/${packageName}_api';
  await FileUtils.insertAlphabeticallyInYamlSection(path, content, pattern);
}

_appsYaml(String packageName, String root, String appName) async {
  print("Adding to apps pubspec/$appName");
  final path = '$root/apps/$appName/pubspec.yaml';
  final pattern = RegExp('^dependencies');
  final content =
      '  ${packageName}:\n    path: ../../packages/${packageName}\n  ${packageName}_api:\n    path: ../../packages/${packageName}_api';
  final contentApi = '  ${packageName}_api:\n    path: ../${packageName}_api';
  await FileUtils.insertAlphabeticallyInYamlSection(path, content, pattern);
}

_coreYaml(String packageName, String root) async {
  print("Adding to core pubspec");
  final path = '$root/packages/core/pubspec.yaml';
  final pattern = RegExp('^dependencies');
  final content = '  ${packageName}_api:\n    path: ../${packageName}_api';
  await FileUtils.insertAlphabeticallyInYamlSection(path, content, pattern);
}

_fishbowlApp(String packageName, String root, String appType) async {
  print("Adding to deployment");
  final rc = ReCase(packageName);
  final path = '$root/apps/$appType/lib/fishbowl_app.dart';
  final importStatement =
      "import 'package:${rc.snakeCase}_api/${rc.snakeCase}_api.dart';";
  await FileUtils.insertImport(path, importStatement);

  final startPattern = RegExp(r'localizationsDelegates: \[');
  final content = 'getApi<${rc.pascalCase}Api>().localizationsDelegate(),';
  final endPattern = RegExp(r'\],');
  await FileUtils.insertAlphabetically(
    path,
    content,
    startPattern: startPattern,
    endPattern: endPattern,
  );
}

_deploymentImpl(String packageName, String root, String appName) async {
  print("Adding to apps/$appName");
  final rc = ReCase(packageName);
  final path = '$root/apps/$appName/lib/standalone_deployment.dart';
  // final ignoreComment = '// ignore: implementation_imports';
  final importStatement =
      "import 'package:${rc.snakeCase}/src/${rc.snakeCase}_api_impl.dart';";
  final importStatement2 =
      "import 'package:${rc.snakeCase}_api/${rc.snakeCase}_api.dart';";
  await FileUtils.insertImport(path, importStatement);
  // await FileUtils.insertBefore(path, ignoreComment, RegExp(importStatement));
  await FileUtils.insertImport(path, importStatement2);

  // Insert alphabetically within registerFeatureApis() function
  final content =
      '    registerApi<${rc.pascalCase}Api>(${rc.pascalCase}ApiImpl());';

  await FileUtils.insertAlphabetically(
    path,
    content,
    startPattern: RegExp(r'registerFeatureApis\(\)\s*\{'),
    endPattern: RegExp(r'^\s*\}'),
    extractKey: (line) {
      // Extract API name from registerApi<ApiName> for sorting
      final match = RegExp(r'registerApi<(\w+)>').firstMatch(line);
      return match?.group(1) ?? '';
    },
  );
}
