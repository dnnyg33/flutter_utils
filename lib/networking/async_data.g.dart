// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Success<T> _$SuccessFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Success<T>(
  data: fromJsonT(json['data']),
  isCached: json['isCached'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SuccessToJson<T>(
  _Success<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'isCached': instance.isCached,
  'runtimeType': instance.$type,
};

_Error<T> _$ErrorFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Error<T>(
  error: json['error'] as String,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  isCached: json['isCached'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ErrorToJson<T>(
  _Error<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'error': instance.error,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
  'isCached': instance.isCached,
  'runtimeType': instance.$type,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_Loading<T> _$LoadingFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Loading<T>(
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  error: json['error'] as String?,
  isCached: json['isCached'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadingToJson<T>(
  _Loading<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': _$nullableGenericToJson(instance.data, toJsonT),
  'error': instance.error,
  'isCached': instance.isCached,
  'runtimeType': instance.$type,
};
