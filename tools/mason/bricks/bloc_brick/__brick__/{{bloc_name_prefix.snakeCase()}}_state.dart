
part of '{{bloc_name_prefix.snakeCase()}}_bloc.dart';

@freezed
sealed class {{bloc_name_prefix.pascalCase()}}State with _${{bloc_name_prefix.pascalCase()}}State {
  const {{bloc_name_prefix.pascalCase()}}State._();

  const factory {{bloc_name_prefix.pascalCase()}}State({
    required AsyncData<dynamic> output, //todo do not use dynamic, use the type of the output. this is only here so that the code compiles.
  }) = _{{bloc_name_prefix.pascalCase()}}State;


  factory {{bloc_name_prefix.pascalCase()}}State.fromJson(Map<String, dynamic> json) => _${{bloc_name_prefix.pascalCase()}}StateFromJson(json);
}
