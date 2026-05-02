import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_utils/feature_api.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{{bloc_name_prefix.snakeCase()}}}_state.dart';
part '{{{bloc_name_prefix.snakeCase()}}}_event.dart';
part '{{{bloc_name_prefix.snakeCase()}}}_data_proxy.dart';
part '{{{bloc_name_prefix.snakeCase()}}}_bloc.freezed.dart';
part '{{{bloc_name_prefix.snakeCase()}}}_bloc.g.dart';

class {{bloc_name_prefix.pascalCase()}}Bloc extends Bloc<{{bloc_name_prefix.pascalCase()}}Event, {{bloc_name_prefix.pascalCase()}}State> {
  {{bloc_name_prefix.pascalCase()}}Bloc()
    : super(
      const {{bloc_name_prefix.pascalCase()}}State(output: AsyncData.loading()),
      ) {
    on<_OnInit>(_onInit);
  }

  FutureOr<void> _onInit(
    _OnInit event,
    Emitter<{{bloc_name_prefix.pascalCase()}}State> emit,
  ) {
    // TODO: Add Logic
  }
}
