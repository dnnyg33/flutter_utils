part of '{{bloc_name_prefix.snakeCase()}}_bloc.dart';

class {{bloc_name_prefix.pascalCase()}}DataProxy extends DataProxy<{{bloc_name_prefix.pascalCase()}}Bloc, {{bloc_name_prefix.pascalCase()}}State> {
  const {{bloc_name_prefix.pascalCase()}}DataProxy({
    super.key,
    super.child,
  }) : super(
onDataChanged: _onDataChanged,
);
  static void _onDataChanged(BuildContext context, {{bloc_name_prefix.pascalCase()}}State state) {
    //todo implement
  }
}