import 'package:auto_route/auto_route.dart';
import 'package:{{package_name.snakeCase()}}/src/{{package_name.snakeCase()}}_entry_point.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Point,Route',
)
class {{package_name.pascalCase()}}Router extends RootStackRouter {
  final String path;

  {{package_name.pascalCase()}}Router({
    super.navigatorKey,
    required this.path,
  });

  @override
  List<AutoRoute> get routes => [{{package_name.pascalCase()}}EntryPoint.route(path: path)];
}
