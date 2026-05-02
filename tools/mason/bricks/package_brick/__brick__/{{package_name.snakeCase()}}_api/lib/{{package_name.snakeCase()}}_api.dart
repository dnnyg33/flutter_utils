import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils/feature_api.dart';

abstract class {{package_name.pascalCase()}}RouteApi extends RouteApi {
  // define functions to expose additional routes here. All functions should return AutoRoute.
}

abstract class {{package_name.pascalCase()}}Api extends FeatureApiWithRoutes<{{package_name.pascalCase()}}RouteApi> {
  // Route functions that return PageRouteInfo for navigation
  PageRouteInfo<Object?> entryPoint();

  // Widgets, utility functions, and blocProviders
  LocalizationsDelegate localizationsDelegate();
}