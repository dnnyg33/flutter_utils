import 'package:core/core.dart';
import 'package:{{package_name.snakeCase()}}/l10n/{{package_name.snakeCase()}}_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:{{package_name.snakeCase()}}/src/{{feature_name.snakeCase()}}/bloc/{{feature_name.snakeCase()}}_bloc.dart';
import 'package:{{{fullPath}}}/ui/{{feature_name.snakeCase()}}_body.dart';
import 'package:{{package_name}}/src/{{package_name.snakeCase()}}_router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils/feature_api.dart';


class {{feature_name.pascalCase()}}Interactions {

  {{feature_name.pascalCase()}}Interactions();

  void onBackPressed(BuildContext context) {
    context.maybePop();
  }
}
/// 
/// {{feature_name.pascalCase()}}Page
/// 
/// Wrapper around page, contains non UI and dependency setup 
/// as well as top level interactions.
/// 
@RoutePage()
class {{feature_name.pascalCase()}}Page extends StatelessWidget {
  static AutoRoute route() {
      return AutoRoute(
        page: {{feature_name.pascalCase()}}Route.page,
        path: '{{feature_name.snakeCase()}}',
      );
  }

  final {{feature_name.pascalCase()}}Interactions interactions = {{feature_name.pascalCase()}}Interactions();

  {{feature_name.pascalCase()}}Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = {{package_name.pascalCase()}}Localizations.of(context)!;
    return BlocProvider(
      create: (context) => {{feature_name.pascalCase()}}Bloc(),
      child: {{feature_name.pascalCase()}}DataProxy(
        child: ResponsivePage(
          title: l10n.title,
          appBarInteractions: AppBarInteractions.defaults(
            context: context,
            onBackPress: (context) => interactions.onBackPressed(context),
          ),
          sliverContentBuilder: (context, scrollController){
            return {{feature_name.pascalCase()}}Body(
              l10n: l10n,
              interactions: interactions,
            );
          },
          mobile: ResponsiveMobilePage(),
          desktop: Boxed.value(
            ResponsiveDesktopPage()
          ),
        ),
      ),
    );
  }
}
