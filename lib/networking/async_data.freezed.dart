// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AsyncData<T> _$AsyncDataFromJson<T>(
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
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AsyncData',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AsyncData<T> {

 T? get data; bool get isCached;
/// Create a copy of AsyncData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsyncDataCopyWith<T, AsyncData<T>> get copyWith => _$AsyncDataCopyWithImpl<T, AsyncData<T>>(this as AsyncData<T>, _$identity);

  /// Serializes this AsyncData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncData<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),isCached);

@override
String toString() {
  return 'AsyncData<$T>(data: $data, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class $AsyncDataCopyWith<T,$Res>  {
  factory $AsyncDataCopyWith(AsyncData<T> value, $Res Function(AsyncData<T>) _then) = _$AsyncDataCopyWithImpl;
@useResult
$Res call({
 bool isCached
});




}
/// @nodoc
class _$AsyncDataCopyWithImpl<T,$Res>
    implements $AsyncDataCopyWith<T, $Res> {
  _$AsyncDataCopyWithImpl(this._self, this._then);

  final AsyncData<T> _self;
  final $Res Function(AsyncData<T>) _then;

/// Create a copy of AsyncData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCached = null,}) {
  return _then(_self.copyWith(
isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AsyncData].
extension AsyncDataPatterns<T> on AsyncData<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success<T> value)?  success,TResult Function( _Error<T> value)?  error,TResult Function( _Loading<T> value)?  loading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success<T> value)  success,required TResult Function( _Error<T> value)  error,required TResult Function( _Loading<T> value)  loading,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _Error():
return error(_that);case _Loading():
return loading(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success<T> value)?  success,TResult? Function( _Error<T> value)?  error,TResult? Function( _Loading<T> value)?  loading,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _Loading() when loading != null:
return loading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data,  bool isCached)?  success,TResult Function( String error,  T? data,  bool isCached)?  error,TResult Function( T? data,  String? error,  bool isCached)?  loading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data,_that.isCached);case _Error() when error != null:
return error(_that.error,_that.data,_that.isCached);case _Loading() when loading != null:
return loading(_that.data,_that.error,_that.isCached);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data,  bool isCached)  success,required TResult Function( String error,  T? data,  bool isCached)  error,required TResult Function( T? data,  String? error,  bool isCached)  loading,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.data,_that.isCached);case _Error():
return error(_that.error,_that.data,_that.isCached);case _Loading():
return loading(_that.data,_that.error,_that.isCached);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data,  bool isCached)?  success,TResult? Function( String error,  T? data,  bool isCached)?  error,TResult? Function( T? data,  String? error,  bool isCached)?  loading,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data,_that.isCached);case _Error() when error != null:
return error(_that.error,_that.data,_that.isCached);case _Loading() when loading != null:
return loading(_that.data,_that.error,_that.isCached);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Success<T> extends AsyncData<T> {
  const _Success({required this.data, this.isCached = false, final  String? $type}): $type = $type ?? 'success',super._();
  factory _Success.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$SuccessFromJson(json,fromJsonT);

@override final  T data;
@override@JsonKey() final  bool isCached;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AsyncData
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),isCached);

@override
String toString() {
  return 'AsyncData<$T>.success(data: $data, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T,$Res> implements $AsyncDataCopyWith<T, $Res> {
  factory _$SuccessCopyWith(_Success<T> value, $Res Function(_Success<T>) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 T data, bool isCached
});




}
/// @nodoc
class __$SuccessCopyWithImpl<T,$Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

/// Create a copy of AsyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? isCached = null,}) {
  return _then(_Success<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Error<T> extends AsyncData<T> {
  const _Error({required this.error, this.data, this.isCached = false, final  String? $type}): $type = $type ?? 'error',super._();
  factory _Error.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ErrorFromJson(json,fromJsonT);

 final  String error;
@override final  T? data;
@override@JsonKey() final  bool isCached;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AsyncData
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,const DeepCollectionEquality().hash(data),isCached);

@override
String toString() {
  return 'AsyncData<$T>.error(error: $error, data: $data, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,$Res> implements $AsyncDataCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 String error, T? data, bool isCached
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of AsyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? data = freezed,Object? isCached = null,}) {
  return _then(_Error<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Loading<T> extends AsyncData<T> {
  const _Loading({this.data, this.error, this.isCached = false, final  String? $type}): $type = $type ?? 'loading',super._();
  factory _Loading.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$LoadingFromJson(json,fromJsonT);

@override final  T? data;
 final  String? error;
@override@JsonKey() final  bool isCached;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AsyncData
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error)&&(identical(other.isCached, isCached) || other.isCached == isCached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),error,isCached);

@override
String toString() {
  return 'AsyncData<$T>.loading(data: $data, error: $error, isCached: $isCached)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<T,$Res> implements $AsyncDataCopyWith<T, $Res> {
  factory _$LoadingCopyWith(_Loading<T> value, $Res Function(_Loading<T>) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 T? data, String? error, bool isCached
});




}
/// @nodoc
class __$LoadingCopyWithImpl<T,$Res>
    implements _$LoadingCopyWith<T, $Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading<T> _self;
  final $Res Function(_Loading<T>) _then;

/// Create a copy of AsyncData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? error = freezed,Object? isCached = null,}) {
  return _then(_Loading<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isCached: null == isCached ? _self.isCached : isCached // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
