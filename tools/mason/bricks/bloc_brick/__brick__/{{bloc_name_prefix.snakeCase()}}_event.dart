
part of '{{bloc_name_prefix.snakeCase()}}_bloc.dart';

@freezed
sealed class {{bloc_name_prefix.pascalCase()}}Event with _${{bloc_name_prefix.pascalCase()}}Event {

  const factory {{bloc_name_prefix.pascalCase()}}Event.onInit() = _OnInit;

}