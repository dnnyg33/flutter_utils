// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_async_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Success<T> _$SuccessFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Success<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  index: (json['index'] as num?)?.toInt() ?? 0,
  count: (json['count'] as num?)?.toInt() ?? 10,
  hasMore: json['hasMore'] as bool? ?? true,
  isCached: json['isCached'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SuccessToJson<T>(
  _Success<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'index': instance.index,
  'count': instance.count,
  'hasMore': instance.hasMore,
  'isCached': instance.isCached,
  'runtimeType': instance.$type,
};

_Error<T> _$ErrorFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Error<T>(
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  error: json['error'] as String,
  index: (json['index'] as num?)?.toInt() ?? 0,
  count: (json['count'] as num?)?.toInt() ?? 10,
  hasMore: json['hasMore'] as bool? ?? true,
  isCached: json['isCached'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ErrorToJson<T>(
  _Error<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data?.map(toJsonT).toList(),
  'error': instance.error,
  'index': instance.index,
  'count': instance.count,
  'hasMore': instance.hasMore,
  'isCached': instance.isCached,
  'runtimeType': instance.$type,
};

_Loading<T> _$LoadingFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Loading<T>(
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  error: json['error'] as String?,
  index: (json['index'] as num?)?.toInt() ?? 0,
  count: (json['count'] as num?)?.toInt() ?? 10,
  hasMore: json['hasMore'] as bool? ?? true,
  isCached: json['isCached'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadingToJson<T>(
  _Loading<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data?.map(toJsonT).toList(),
  'error': instance.error,
  'index': instance.index,
  'count': instance.count,
  'hasMore': instance.hasMore,
  'isCached': instance.isCached,
  'runtimeType': instance.$type,
};

_LoadingMore<T> _$LoadingMoreFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _LoadingMore<T>(
  data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
  error: json['error'] as String?,
  index: (json['index'] as num?)?.toInt() ?? 0,
  count: (json['count'] as num?)?.toInt() ?? 10,
  hasMore: json['hasMore'] as bool? ?? true,
  isCached: json['isCached'] as bool? ?? false,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoadingMoreToJson<T>(
  _LoadingMore<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data?.map(toJsonT).toList(),
  'error': instance.error,
  'index': instance.index,
  'count': instance.count,
  'hasMore': instance.hasMore,
  'isCached': instance.isCached,
  'runtimeType': instance.$type,
};
