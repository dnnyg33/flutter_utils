import 'dart:io';

import 'package:file_utils/file_utils.dart';
import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

// hook assumes root directory of project is named flutterbowl
void run(HookContext context) async {
  final logger = context.logger;
  final progress = logger.progress('Wiring up new feature...');

  const rootDir = 'flutterbowl';
  final root = FileUtils.relativeToRootPathPrefix(rootDir);

  final String featureName = context.vars['feature_name'];
  final String packageName = context.vars['package_name'];
  final rc = ReCase(featureName);

  await _packageApi(packageName, featureName, root);
  // await _easterBunny(featureName, root);
  // await _testsBundle(featureName, root, context);

  progress.complete(green.wrap('${rc.titleCase} is ready!') as String);
}

Future<void> _packageApi(
  String packageName,
  String featureName,
  String root,
) async {
  final featureNameRc = ReCase(featureName);
  final packageNameRc = ReCase(packageName);

  // Add abstract method to RouteApi
  final apiPath =
      '${root}/packages/${packageNameRc.snakeCase}_api/lib/${packageNameRc.snakeCase}_api.dart';
  final apiPattern = RegExp(r'^// define functions');
  final apiContent = '''
  ${featureNameRc.pascalCase}Router ${featureNameRc.camelCase}Router({required String path});
''';

  // Add implementation to RouteApiImpl
  final implPath =
      '${root}/packages/${packageNameRc.snakeCase}/lib/src/${packageNameRc.snakeCase}_api_impl.dart';
  final implPattern = RegExp(r'^// implement functions');
  final implContent = '''
  @override
  ${featureNameRc.pascalCase}Router ${featureNameRc.camelCase}Router({required String path}) {
    return ${featureNameRc.pascalCase}Router(path: path);
  }
''';

  // Add import for the feature router to impl file
  final importStatement =
      "import 'package:${packageNameRc.snakeCase}/${packageNameRc.snakeCase}.dart';";

  await FileUtils.insertBefore(apiPath, apiContent, apiPattern);
  await FileUtils.insertImport(implPath, importStatement);
  await FileUtils.insertBefore(implPath, implContent, implPattern);
}


Future<void> _easterBunny(String featureName, String root) async {
  final rc = ReCase(featureName);
  final pattern = RegExp('^\];\$');

  final path = '${root}/packages/easter_egg/lib/src/widgets/easter_bunny.dart';
  final content =
      '  Shortcut("${rc.titleCase}", Icons.science, Sherpa.${rc.camelCase}Route()),';

  await FileUtils.insertBefore(path, content, pattern);
}

Future<void> _testsBundle(
  String featureName,
  String root,
  HookContext context,
) async {
  //```mason bundle ./feature_brick_tests -t dart -o ./feature_brick_tests```
  final featureBrickTestsBundle = MasonBundle.fromJson(<String, dynamic>{
    "files": [
      {
        "path":
            "{{feature_name.snakeCase()}}/bloc/{{feature_name.snakeCase()}}_bloc_test.dart",
        "data":
            "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzCgppbXBvcnQgJ3BhY2thZ2U6YmxvY190ZXN0L2Jsb2NfdGVzdC5kYXJ0JzsKaW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXJfdGVzdC9mbHV0dGVyX3Rlc3QuZGFydCc7CmltcG9ydCAncGFja2FnZTp7e3tmdWxsUGF0aH19fS9ibG9jL3t7ZmVhdHVyZV9uYW1lLnNuYWtlQ2FzZSgpfX1fYmxvYy97e2ZlYXR1cmVfbmFtZS5zbmFrZUNhc2UoKX19X2Jsb2MuZGFydCc7Cgp2b2lkIG1haW4oKSB7CiAgZ3JvdXAoJ3t7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYycsICgpIHsKICAgIGdyb3VwKCdjb25zdHJ1Y3RvcicsICgpIHsKICAgICAgdGVzdCgnY2FuIGJlIGluc3RhbnRpYXRlZCcsICgpIHsKICAgICAgICBleHBlY3QoCiAgICAgICAgICB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUJsb2MoKSwKICAgICAgICAgIGlzTm90TnVsbCwKICAgICAgICApOwogICAgICB9KTsKICAgIH0pOwoKICAgIHRlc3QoJ2luaXRpYWwgc3RhdGUgaGFzIGRlZmF1bHQgdmFsdWUgZm9yIGN1c3RvbVByb3BlcnR5JywgKCkgewogICAgICBmaW5hbCB7e2ZlYXR1cmVfbmFtZS5jYW1lbENhc2UoKX19QmxvYyA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYygpOwogICAgICBleHBlY3Qoe3tmZWF0dXJlX25hbWUuY2FtZWxDYXNlKCl9fUJsb2Muc3RhdGUuY3VzdG9tUHJvcGVydHksIGVxdWFscygne3tmZWF0dXJlX25hbWUuc25ha2VDYXNlKCl9fScpKTsKICAgIH0pOwoKICAgIGJsb2NUZXN0PHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19QmxvYywge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZT4oCiAgICAgICdDdXN0b217e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fUV2ZW50IGVtaXRzIG5vdGhpbmcnLAogICAgICBidWlsZDoge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1CbG9jLm5ldywKICAgICAgYWN0OiAoYmxvYykgPT4gYmxvYy5hZGQoY29uc3Qge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudC5pbml0aWFsKCkpLAogICAgICBleHBlY3Q6ICgpID0+IDx7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlPltdLAogICAgKTsKICB9KTsKfQo=",
        "type": "text",
      },
      {
        "path":
            "{{feature_name.snakeCase()}}/bloc/{{feature_name.snakeCase()}}_event_test.dart",
        "data":
            "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzCgppbXBvcnQgJ3BhY2thZ2U6Zmx1dHRlcl90ZXN0L2ZsdXR0ZXJfdGVzdC5kYXJ0JzsKaW1wb3J0ICdwYWNrYWdlOnt7e2Z1bGxQYXRofX19L2Jsb2Mve3tmZWF0dXJlX25hbWUuc25ha2VDYXNlKCl9fV9ibG9jL3t7ZmVhdHVyZV9uYW1lLnNuYWtlQ2FzZSgpfX1fYmxvYy5kYXJ0JzsKCnZvaWQgbWFpbigpIHsKICBncm91cCgne3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1FdmVudCcsICgpIHsge3sjdXNlX2VxdWF0YWJsZX19IAogICAgZ3JvdXAoJ0N1c3RvbXt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19RXZlbnQnLCAoKSB7CiAgICAgIHRlc3QoJ3N1cHBvcnRzIHZhbHVlIGVxdWFsaXR5JywgKCkgewogICAgICAgIGV4cGVjdCgKICAgICAgICAgIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19RXZlbnQuaW5pdGlhbCgpLAogICAgICAgICAgZXF1YWxzKGNvbnN0IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19RXZlbnQuaW5pdGlhbCgpKSwKICAgICAgICApOwogICAgICB9KTsKICAgIH0pO3t7L3VzZV9lcXVhdGFibGV9fQogICAgZ3JvdXAoJ2NvbnN0cnVjdG9yJywgKCkgewogICAgICB0ZXN0KCdjYW4gYmUgaW5zdGFudGlhdGVkJywgKCkgewogICAgICAgIGV4cGVjdCgKICAgICAgICAgIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19RXZlbnQuaW5pdGlhbCgpLAogICAgICAgICAgaXNOb3ROdWxsCiAgICAgICAgKTsKICAgICAgfSk7CiAgICB9KTsKICB9KTsKfQo=",
        "type": "text",
      },
      {
        "path":
            "{{feature_name.snakeCase()}}/bloc/{{feature_name.snakeCase()}}_state_test.dart",
        "data":
            "Ly8gaWdub3JlX2Zvcl9maWxlOiBwcmVmZXJfY29uc3RfY29uc3RydWN0b3JzCgppbXBvcnQgJ3BhY2thZ2U6Zmx1dHRlcl90ZXN0L2ZsdXR0ZXJfdGVzdC5kYXJ0JzsKaW1wb3J0ICdwYWNrYWdlOnt7e2Z1bGxQYXRofX19L2Jsb2Mve3tmZWF0dXJlX25hbWUuc25ha2VDYXNlKCl9fV9ibG9jL3t7ZmVhdHVyZV9uYW1lLnNuYWtlQ2FzZSgpfX1fYmxvYy5kYXJ0JzsKCnZvaWQgbWFpbigpIHsKICBncm91cCgne3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZScsICgpIHsKICAgIHRlc3QoJ3N1cHBvcnRzIHZhbHVlIGVxdWFsaXR5JywgKCkgewogICAgICBleHBlY3QoCiAgICAgICAge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZS5pbml0aWFsKGN1c3RvbVByb3BlcnR5OiAiRGVmYXVsdCBWYWx1ZSIpLAogICAgICAgIGVxdWFscygKICAgICAgICAgIHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUuaW5pdGlhbChjdXN0b21Qcm9wZXJ0eTogIkRlZmF1bHQgVmFsdWUiKSwKICAgICAgICApLAogICAgICApOwogICAgfSk7CgogICAgZ3JvdXAoJ2NvbnN0cnVjdG9yJywgKCkgewogICAgICB0ZXN0KCdjYW4gYmUgaW5zdGFudGlhdGVkJywgKCkgewogICAgICAgIGV4cGVjdCgKICAgICAgICAgIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUuaW5pdGlhbChjdXN0b21Qcm9wZXJ0eTogIiIpLAogICAgICAgICAgaXNOb3ROdWxsLAogICAgICAgICk7CiAgICAgIH0pOwogICAgfSk7CgogICAgZ3JvdXAoJ2NvcHlXaXRoJywgKCkgewogICAgICB0ZXN0KAogICAgICAgICdjb3BpZXMgY29ycmVjdGx5ICcKICAgICAgICAnd2hlbiBubyBhcmd1bWVudCBzcGVjaWZpZWQnLAogICAgICAgICgpIHsKICAgICAgICAgIGNvbnN0IHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZSA9IHt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUuaW5pdGlhbCgKICAgICAgICAgICAgY3VzdG9tUHJvcGVydHk6ICdNeSBwcm9wZXJ0eScsCiAgICAgICAgICApOwogICAgICAgICAgZXhwZWN0KAogICAgICAgICAgICB7e2ZlYXR1cmVfbmFtZS5jYW1lbENhc2UoKX19U3RhdGUuY29weVdpdGgoKSwKICAgICAgICAgICAgZXF1YWxzKHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZSksCiAgICAgICAgICApOwogICAgICAgIH0sCiAgICAgICk7CgogICAgICB0ZXN0KAogICAgICAgICdjb3BpZXMgY29ycmVjdGx5ICcKICAgICAgICAnd2hlbiBhbGwgYXJndW1lbnRzIHNwZWNpZmllZCcsCiAgICAgICAgKCkgewogICAgICAgICAgY29uc3Qge3tmZWF0dXJlX25hbWUuY2FtZWxDYXNlKCl9fVN0YXRlID0ge3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZS5pbml0aWFsKAogICAgICAgICAgICBjdXN0b21Qcm9wZXJ0eTogJ015IHByb3BlcnR5JywKICAgICAgICAgICk7CiAgICAgICAgICBmaW5hbCBvdGhlcnt7ZmVhdHVyZV9uYW1lLnBhc2NhbENhc2UoKX19U3RhdGUgPSB7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlLmluaXRpYWwoCiAgICAgICAgICAgIGN1c3RvbVByb3BlcnR5OiAnTXkgcHJvcGVydHkgMicsCiAgICAgICAgICApOwogICAgICAgICAgZXhwZWN0KHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZSwgaXNOb3QoZXF1YWxzKG90aGVye3tmZWF0dXJlX25hbWUucGFzY2FsQ2FzZSgpfX1TdGF0ZSkpKTsKCiAgICAgICAgICBleHBlY3QoCiAgICAgICAgICAgIHt7ZmVhdHVyZV9uYW1lLmNhbWVsQ2FzZSgpfX1TdGF0ZS5jb3B5V2l0aCgKICAgICAgICAgICAgICBjdXN0b21Qcm9wZXJ0eTogb3RoZXJ7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlLmN1c3RvbVByb3BlcnR5LAogICAgICAgICAgICApLAogICAgICAgICAgICBlcXVhbHMob3RoZXJ7e2ZlYXR1cmVfbmFtZS5wYXNjYWxDYXNlKCl9fVN0YXRlKSwKICAgICAgICAgICk7CiAgICAgICAgfSwKICAgICAgKTsKICAgIH0pOwogIH0pOwp9Cg==",
        "type": "text",
      },
    ],
    "hooks": [
      {
        "path": "pre_gen.dart",
        "data":
            "aW1wb3J0ICdwYWNrYWdlOm1hc29uL21hc29uLmRhcnQnOwoKdm9pZCBydW4oSG9va0NvbnRleHQgY29udGV4dCkgewogIC8vIFRPRE86IGFkZCBwcmUtZ2VuZXJhdGlvbiBsb2dpYy4KfQo=",
        "type": "text",
      },
      {
        "path": "pubspec.yaml",
        "data":
            "bmFtZTogZmVhdHVyZV9icmlja190ZXN0c19ob29rcwoKZW52aXJvbm1lbnQ6CiAgc2RrOiAiPj0yLjEyLjAgPDMuMC4wIgoKZGVwZW5kZW5jaWVzOgogIG1hc29uOiBeMC4xLjAtZGV2Cg==",
        "type": "text",
      },
    ],
    "name": "feature_brick_tests",
    "description":
        "A supporting brick for feature_brick that creates tests with 100% coverage",
    "version": "0.0.1",
    "environment": {"mason": ">=0.1.0-dev.26 <0.1.0"},
    "repository":
        "https://github.com/LukeMoody01/mason_bricks/tree/master/bricks/feature_brick_tests",
    "readme": {
      "path": "README.md",
      "data":
          "IyBGZWF0dXJlIEJyaWNrIFRlc3RzCgpBIHN1cHBvcnRpbmcgYnJpY2sgdG8gY3JlYXRlIHlvdXIgZmVhdHVyZXMgdGVzdHMgd2l0aCAxMDAlIGNvdmVyYWdlIHVzaW5nIGJlc3QgcHJhY3RpY2VzIGFuZCB5b3VyIHN0YXRlIG1hbmFnZW1lbnQgb2YgY2hvaWNlISBTdXBwb3J0cyBCbG9jLCBDdWJpdCwgTm9uZS4KCiMjIEhvdyB0byB1c2Ug8J+agAoKYGBgCm1hc29uIG1ha2UgZmVhdHVyZV9icmljayAtLWZlYXR1cmVfbmFtZSBsb2dpbiAtLXN0YXRlX21hbmFnZW1lbnQgYmxvYwpgYGAKCmlmIHlvdSBtYWtlIGNoYW5nZXMgYW5kIG5lZWQgdG8gcmVnZW5lcmF0ZSB0aGUgYnVuZGxlLCBydW4gKGV4YW1wbGUgcmFuIGluIHRoZSBtYXNvbl9icmlja3MgZGlyZWN0b3J5KToKCmBgYAptYXNvbiBidW5kbGUgLi9mZWF0dXJlX2JyaWNrX3Rlc3RzIC10IGRhcnQgLW8gLi9mZWF0dXJlX2JyaWNrX3Rlc3RzCmBgYAoKCiMjIFZhcmlhYmxlcyDinKgKCk4vQSBhcyB0aGlzIGlzIGEgc3VwcG9ydGluZyBicmljayBmb3IgZmVhdHVyZV9icmljawoKIyMgT3V0cHV0cyDwn5OmCgpgYGAKLS1mZWF0dXJlX25hbWUgbG9naW4gLS1zdGF0ZV9tYW5hZ2VtZW50IGJsb2MK4pSc4pSA4pSAIGxvZ2luCuKUgiAgIOKUnOKUgOKUgCBibG9jCuKUgiAgIOKUgiAgIOKUnOKUgOKUgCBsb2dpbl9ibG9jX3Rlc3QuZGFydArilIIgICDilIIgICDilJzilIDilIAgbG9naW5fZXZlbnRfdGVzdC5kYXJ0CuKUgiAgIOKUgiAgIOKUlOKUgOKUgCBsb2dpbl9zdGF0ZV90ZXN0LmRhcnQK4pSCICAg4pSc4pSA4pSAIHZpZXcK4pSCICAg4pSCICAg4pSc4pSA4pSAIGxvZ2luX3BhZ2VfdGVzdC5kYXJ0CuKUgiAgIOKUgiAgIOKUlOKUgOKUgHdpZGdldHMK4pSCICAg4pSCICAgICAgIOKUlOKUgOKUgCBsb2dpbl9ib2R5X3Rlc3QuZGFydArilJTilIDilIAgLi4uCmBgYAoKYGBgCi0tZmVhdHVyZV9uYW1lIGxvZ2luIC0tc3RhdGVfbWFuYWdlbWVudCBjdWJpdArilJzilIDilIAgbG9naW4K4pSCICAg4pSc4pSA4pSAIGN1Yml0CuKUgiAgIOKUgiAgIOKUnOKUgOKUgCBsb2dpbl9jdWJpdF90ZXN0LmRhcnQK4pSCICAg4pSCICAg4pSU4pSA4pSAIGxvZ2luX3N0YXRlX3Rlc3QuZGFydArilIIgICDilJzilIDilIAgdmlldwrilIIgICDilIIgICDilJzilIDilIAgbG9naW5fcGFnZV90ZXN0LmRhcnQK4pSCICAg4pSCICAg4pSU4pSA4pSAd2lkZ2V0cwrilIIgICDilIIgICAgICAg4pSU4pSA4pSAIGxvZ2luX2JvZHlfdGVzdC5kYXJ0CuKUlOKUgOKUgCAuLi4KYGBgCg==",
      "type": "text",
    },
    "changelog": {
      "path": "CHANGELOG.md",
      "data":
          "IyAwLjAuMQoKLSBDcmVhdGUgaW5pdGlhbCBGZWF0dXJlIEJyaWNrIFRlc3RzIHdoaWNoIHN1cHBvcnRzIGJsb2MsIGN1Yml0LCBhbmQgbm9uZQo=",
      "type": "text",
    },
    "license": {
      "path": "LICENSE",
      "data":
          "TUlUIExpY2Vuc2UKCkNvcHlyaWdodCAoYykgMjAyMyBMdWtlIE1vb2R5CgpQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5Cm9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCmluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbApjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKClRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbApjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgoKVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCkZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQpBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCkxJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCk9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFClNPRlRXQVJFLgo=",
      "type": "text",
    },
    "vars": {},
  });

  final featureTestGen = await MasonGenerator.fromBundle(
    featureBrickTestsBundle,
  );

  final rc = ReCase(featureName);
  final path = '${root}/packages/core/test/${rc.snakeCase}/bloc';

  await featureTestGen.generate(
    DirectoryGeneratorTarget(Directory(path)),
    logger: context.logger,
    vars: context.vars,
  );
}
