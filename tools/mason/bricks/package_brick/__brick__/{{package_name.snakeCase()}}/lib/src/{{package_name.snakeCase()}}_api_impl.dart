import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{package_name.snakeCase()}}/{{package_name.snakeCase()}}.dart';
import 'package:{{package_name.snakeCase()}}_api/{{package_name.snakeCase()}}_api.dart';

class _RouteApiImpl extends {{package_name.pascalCase()}}RouteApi {
  // implement functions to expose routes here. All functions should return AutoRoute.
}

class {{package_name.pascalCase()}}ApiImpl implements {{package_name.pascalCase()}}Api {
  @override
  {{package_name.pascalCase()}}RouteApi get routes => _RouteApiImpl();

  @override
  PageRouteInfo<Object?> entryPoint() {
    return {{package_name.pascalCase()}}EntryRoute();
  }

  @override
  LocalizationsDelegate<{{package_name.pascalCase()}}Localizations> localizationsDelegate() {
    return {{package_name.pascalCase()}}Localizations.delegate;
  }

  // implement functions to expose widgets and blocProviders
}