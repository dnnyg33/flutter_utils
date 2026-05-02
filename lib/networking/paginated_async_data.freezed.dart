// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_async_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PaginatedAsyncData<T> _$PaginatedAsyncDataFromJson<T>(
  Map<String, dynamic> json,T Function(Object?) fromJsonT
) {
        switch (json['runtimeType']) {
                  case 'success':
          return _Success<T>.fromJson(
            json,fromJsonT
          );
                case 'error':
          return _Error<T>.fromJson(
            json,fromJsonT
          );
                case 'loading':
          return _Loading<T>.fromJson(
            json,fromJsonT
          );
                case 'loadingMore':
          return _LoadingMore<T>.fromJson(
            json,fromJsonT
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'PaginatedAsyncData',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$PaginatedAsyncData<T> {

 List<T>? get data; int get index; int get count; bool get hasMore; bool get isCached;
/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedAsyncDataCopyWith<T, PaginatedAsyncData<T>> get copyWith => _$PaginatedAsyncDataCopyWithImpl<T, PaginatedAsyncData<T>>(this as PaginatedAsyncData<T>, _$identity);

  /// Serializes this PaginatedAsyncData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedAsyncData<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.index, index) || other.index == index)&&(identical(other.count, count) || other.count == count)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),index,count,hasMore,isCached);

@override
String toString() {
  return 'PaginatedAsyncData<$T>(data: $data, index: $index, count: $count, hasMore: $hasMore, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class $PaginatedAsyncDataCopyWith<T,$Res>  {
  factory $PaginatedAsyncDataCopyWith(PaginatedAsyncData<T> value, $Res Function(PaginatedAsyncData<T>) _then) = _$PaginatedAsyncDataCopyWithImpl;
@useResult
$Res call({
 List<T> data, int index, int count, bool hasMore, bool isCached
});




}
/// @nodoc
class _$PaginatedAsyncDataCopyWithImpl<T,$Res>
    implements $PaginatedAsyncDataCopyWith<T, $Res> {
  _$PaginatedAsyncDataCopyWithImpl(this._self, this._then);

  final PaginatedAsyncData<T> _self;
  final $Res Function(PaginatedAsyncData<T>) _then;

/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? index = null,Object? count = null,Object? hasMore = null,Object? isCached = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data! : data // ignore: cast_nullable_to_non_nullable
as List<T>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedAsyncData].
extension PaginatedAsyncDataPatterns<T> on PaginatedAsyncData<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success<T> value)?  success,TResult Function( _Error<T> value)?  error,TResult Function( _Loading<T> value)?  loading,TResult Function( _LoadingMore<T> value)?  loadingMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingMore() when loadingMore != null:
return loadingMore(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success<T> value)  success,required TResult Function( _Error<T> value)  error,required TResult Function( _Loading<T> value)  loading,required TResult Function( _LoadingMore<T> value)  loadingMore,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _Error():
return error(_that);case _Loading():
return loading(_that);case _LoadingMore():
return loadingMore(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success<T> value)?  success,TResult? Function( _Error<T> value)?  error,TResult? Function( _Loading<T> value)?  loading,TResult? Function( _LoadingMore<T> value)?  loadingMore,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingMore() when loadingMore != null:
return loadingMore(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<T> data,  int index,  int count,  bool hasMore,  bool isCached)?  success,TResult Function( List<T>? data,  String error,  int index,  int count,  bool hasMore,  bool isCached)?  error,TResult Function( List<T>? data,  String? error,  int index,  int count,  bool hasMore,  bool isCached)?  loading,TResult Function( List<T>? data,  String? error,  int index,  int count,  bool hasMore,  bool isCached)?  loadingMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data,_that.index,_that.count,_that.hasMore,_that.isCached);case _Error() when error != null:
return error(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _Loading() when loading != null:
return loading(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _LoadingMore() when loadingMore != null:
return loadingMore(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<T> data,  int index,  int count,  bool hasMore,  bool isCached)  success,required TResult Function( List<T>? data,  String error,  int index,  int count,  bool hasMore,  bool isCached)  error,required TResult Function( List<T>? data,  String? error,  int index,  int count,  bool hasMore,  bool isCached)  loading,required TResult Function( List<T>? data,  String? error,  int index,  int count,  bool hasMore,  bool isCached)  loadingMore,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.data,_that.index,_that.count,_that.hasMore,_that.isCached);case _Error():
return error(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _Loading():
return loading(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _LoadingMore():
return loadingMore(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<T> data,  int index,  int count,  bool hasMore,  bool isCached)?  success,TResult? Function( List<T>? data,  String error,  int index,  int count,  bool hasMore,  bool isCached)?  error,TResult? Function( List<T>? data,  String? error,  int index,  int count,  bool hasMore,  bool isCached)?  loading,TResult? Function( List<T>? data,  String? error,  int index,  int count,  bool hasMore,  bool isCached)?  loadingMore,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data,_that.index,_that.count,_that.hasMore,_that.isCached);case _Error() when error != null:
return error(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _Loading() when loading != null:
return loading(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _LoadingMore() when loadingMore != null:
return loadingMore(_that.data,_that.error,_that.index,_that.count,_that.hasMore,_that.isCached);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Success<T> extends PaginatedAsyncData<T> {
  const _Success({required final  List<T> data, this.index = 0, this.count = 10, this.hasMore = true, this.isCached = false, final  String? $type}): _data = data,$type = $type ?? 'success',super._();
  factory _Success.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$SuccessFromJson(json,fromJsonT);

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int index;
@override@JsonKey() final  int count;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isCached;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<T, _Success<T>> get copyWith => __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$SuccessToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.index, index) || other.index == index)&&(identical(other.count, count) || other.count == count)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),index,count,hasMore,isCached);

@override
String toString() {
  return 'PaginatedAsyncData<$T>.success(data: $data, index: $index, count: $count, hasMore: $hasMore, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T,$Res> implements $PaginatedAsyncDataCopyWith<T, $Res> {
  factory _$SuccessCopyWith(_Success<T> value, $Res Function(_Success<T>) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, int index, int count, bool hasMore, bool isCached
});




}
/// @nodoc
class __$SuccessCopyWithImpl<T,$Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? index = null,Object? count = null,Object? hasMore = null,Object? isCached = null,}) {
  return _then(_Success<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Error<T> extends PaginatedAsyncData<T> {
  const _Error({final  List<T>? data, required this.error, this.index = 0, this.count = 10, this.hasMore = true, this.isCached = false, final  String? $type}): _data = data,$type = $type ?? 'error',super._();
  factory _Error.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ErrorFromJson(json,fromJsonT);

 final  List<T>? _data;
@override List<T>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String error;
@override@JsonKey() final  int index;
@override@JsonKey() final  int count;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isCached;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ErrorToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.error, error) || other.error == error)&&(identical(other.index, index) || other.index == index)&&(identical(other.count, count) || other.count == count)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),error,index,count,hasMore,isCached);

@override
String toString() {
  return 'PaginatedAsyncData<$T>.error(data: $data, error: $error, index: $index, count: $count, hasMore: $hasMore, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,$Res> implements $PaginatedAsyncDataCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 List<T>? data, String error, int index, int count, bool hasMore, bool isCached
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? error = null,Object? index = null,Object? count = null,Object? hasMore = null,Object? isCached = null,}) {
  return _then(_Error<T>(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>?,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Loading<T> extends PaginatedAsyncData<T> {
  const _Loading({final  List<T>? data, this.error, this.index = 0, this.count = 10, this.hasMore = true, this.isCached = false, final  String? $type}): _data = data,$type = $type ?? 'loading',super._();
  factory _Loading.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$LoadingFromJson(json,fromJsonT);

 final  List<T>? _data;
@override List<T>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? error;
@override@JsonKey() final  int index;
@override@JsonKey() final  int count;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isCached;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<T, _Loading<T>> get copyWith => __$LoadingCopyWithImpl<T, _Loading<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$LoadingToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.error, error) || other.error == error)&&(identical(other.index, index) || other.index == index)&&(identical(other.count, count) || other.count == count)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),error,index,count,hasMore,isCached);

@override
String toString() {
  return 'PaginatedAsyncData<$T>.loading(data: $data, error: $error, index: $index, count: $count, hasMore: $hasMore, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<T,$Res> implements $PaginatedAsyncDataCopyWith<T, $Res> {
  factory _$LoadingCopyWith(_Loading<T> value, $Res Function(_Loading<T>) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 List<T>? data, String? error, int index, int count, bool hasMore, bool isCached
});




}
/// @nodoc
class __$LoadingCopyWithImpl<T,$Res>
    implements _$LoadingCopyWith<T, $Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading<T> _self;
  final $Res Function(_Loading<T>) _then;

/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? error = freezed,Object? index = null,Object? count = null,Object? hasMore = null,Object? isCached = null,}) {
  return _then(_Loading<T>(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _LoadingMore<T> extends PaginatedAsyncData<T> {
  const _LoadingMore({final  List<T>? data, this.error, this.index = 0, this.count = 10, this.hasMore = true, this.isCached = false, final  String? $type}): _data = data,$type = $type ?? 'loadingMore',super._();
  factory _LoadingMore.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$LoadingMoreFromJson(json,fromJsonT);

 final  List<T>? _data;
@override List<T>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? error;
@override@JsonKey() final  int index;
@override@JsonKey() final  int count;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isCached;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingMoreCopyWith<T, _LoadingMore<T>> get copyWith => __$LoadingMoreCopyWithImpl<T, _LoadingMore<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$LoadingMoreToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingMore<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.error, error) || other.error == error)&&(identical(other.index, index) || other.index == index)&&(identical(other.count, count) || other.count == count)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),error,index,count,hasMore,isCached);

@override
String toString() {
  return 'PaginatedAsyncData<$T>.loadingMore(data: $data, error: $error, index: $index, count: $count, hasMore: $hasMore, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$LoadingMoreCopyWith<T,$Res> implements $PaginatedAsyncDataCopyWith<T, $Res> {
  factory _$LoadingMoreCopyWith(_LoadingMore<T> value, $Res Function(_LoadingMore<T>) _then) = __$LoadingMoreCopyWithImpl;
@override @useResult
$Res call({
 List<T>? data, String? error, int index, int count, bool hasMore, bool isCached
});




}
/// @nodoc
class __$LoadingMoreCopyWithImpl<T,$Res>
    implements _$LoadingMoreCopyWith<T, $Res> {
  __$LoadingMoreCopyWithImpl(this._self, this._then);

  final _LoadingMore<T> _self;
  final $Res Function(_LoadingMore<T>) _then;

/// Create a copy of PaginatedAsyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? error = freezed,Object? index = null,Object? count = null,Object? hasMore = null,Object? isCached = null,}) {
  return _then(_LoadingMore<T>(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
