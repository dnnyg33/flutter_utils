import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:{{package_name.snakeCase()}}/src/{{package_name.snakeCase()}}_router.gr.dart';

@RoutePage()
class {{package_name.pascalCase()}}EntryPoint extends StatelessWidget {
  static AutoRoute route({
    required String path,
  }) {
    return AutoRoute(
      page: {{package_name.pascalCase()}}EntryRoute.page,
      path: path,
      // children: [
      //   TODO: Add feature pages here
      // ],
    );
  }

  const {{package_name.pascalCase()}}EntryPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if(context.router.hasEntries) {
      return const AutoRouter(
        inheritNavigatorObservers: false,
      );
    } else {
    // Show placeholder until feature pages are added
    return const Scaffold(
      body: ComingSoonWidget(featureName: '{{package_name.titleCase()}}'),
    );
    }
  }
}
