// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AsyncOperation<T> _$AsyncOperationFromJson<T>(
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
                case 'processing':
          return _Processing<T>.fromJson(
            json,fromJsonT
          );
                case 'idle':
          return _Idle<T>.fromJson(
            json,fromJsonT
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AsyncOperation',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AsyncOperation<T> {

 T? get data;

  /// Serializes this AsyncOperation to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncOperation<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AsyncOperation<$T>(data: $data)';
}


}

/// @nodoc
class $AsyncOperationCopyWith<T,$Res>  {
$AsyncOperationCopyWith(AsyncOperation<T> _, $Res Function(AsyncOperation<T>) __);
}


/// Adds pattern-matching-related methods to [AsyncOperation].
extension AsyncOperationPatterns<T> on AsyncOperation<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success<T> value)?  success,TResult Function( _Error<T> value)?  error,TResult Function( _Processing<T> value)?  processing,TResult Function( _Idle<T> value)?  idle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _Processing() when processing != null:
return processing(_that);case _Idle() when idle != null:
return idle(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success<T> value)  success,required TResult Function( _Error<T> value)  error,required TResult Function( _Processing<T> value)  processing,required TResult Function( _Idle<T> value)  idle,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _Error():
return error(_that);case _Processing():
return processing(_that);case _Idle():
return idle(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success<T> value)?  success,TResult? Function( _Error<T> value)?  error,TResult? Function( _Processing<T> value)?  processing,TResult? Function( _Idle<T> value)?  idle,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _Processing() when processing != null:
return processing(_that);case _Idle() when idle != null:
return idle(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( String error,  T? data)?  error,TResult Function( T? data,  String? error)?  processing,TResult Function( T? data)?  idle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _Error() when error != null:
return error(_that.error,_that.data);case _Processing() when processing != null:
return processing(_that.data,_that.error);case _Idle() when idle != null:
return idle(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( String error,  T? data)  error,required TResult Function( T? data,  String? error)  processing,required TResult Function( T? data)  idle,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.data);case _Error():
return error(_that.error,_that.data);case _Processing():
return processing(_that.data,_that.error);case _Idle():
return idle(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( String error,  T? data)?  error,TResult? Function( T? data,  String? error)?  processing,TResult? Function( T? data)?  idle,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _Error() when error != null:
return error(_that.error,_that.data);case _Processing() when processing != null:
return processing(_that.data,_that.error);case _Idle() when idle != null:
return idle(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Success<T> extends AsyncOperation<T> {
  const _Success({required this.data, final  String? $type}): $type = $type ?? 'success',super._();
  factory _Success.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$SuccessFromJson(json,fromJsonT);

@override final  T data;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<T, _Success<T>> get copyWith => __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$SuccessToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AsyncOperation<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T,$Res> implements $AsyncOperationCopyWith<T, $Res> {
  factory _$SuccessCopyWith(_Success<T> value, $Res Function(_Success<T>) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$SuccessCopyWithImpl<T,$Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_Success<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Error<T> extends AsyncOperation<T> {
  const _Error({required this.error, this.data, final  String? $type}): $type = $type ?? 'error',super._();
  factory _Error.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ErrorFromJson(json,fromJsonT);

 final  String error;
@override final  T? data;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ErrorToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AsyncOperation<$T>.error(error: $error, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,$Res> implements $AsyncOperationCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String error, T? data
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? data = freezed,}) {
  return _then(_Error<T>(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Processing<T> extends AsyncOperation<T> {
  const _Processing({this.data, this.error, final  String? $type}): $type = $type ?? 'processing',super._();
  factory _Processing.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ProcessingFromJson(json,fromJsonT);

@override final  T? data;
 final  String? error;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessingCopyWith<T, _Processing<T>> get copyWith => __$ProcessingCopyWithImpl<T, _Processing<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ProcessingToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),error);

@override
String toString() {
  return 'AsyncOperation<$T>.processing(data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProcessingCopyWith<T,$Res> implements $AsyncOperationCopyWith<T, $Res> {
  factory _$ProcessingCopyWith(_Processing<T> value, $Res Function(_Processing<T>) _then) = __$ProcessingCopyWithImpl;
@useResult
$Res call({
 T? data, String? error
});




}
/// @nodoc
class __$ProcessingCopyWithImpl<T,$Res>
    implements _$ProcessingCopyWith<T, $Res> {
  __$ProcessingCopyWithImpl(this._self, this._then);

  final _Processing<T> _self;
  final $Res Function(_Processing<T>) _then;

/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? error = freezed,}) {
  return _then(_Processing<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Idle<T> extends AsyncOperation<T> {
  const _Idle({this.data, final  String? $type}): $type = $type ?? 'idle',super._();
  factory _Idle.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$IdleFromJson(json,fromJsonT);

@override final  T? data;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdleCopyWith<T, _Idle<T>> get copyWith => __$IdleCopyWithImpl<T, _Idle<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$IdleToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle<T>&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AsyncOperation<$T>.idle(data: $data)';
}


}

/// @nodoc
abstract mixin class _$IdleCopyWith<T,$Res> implements $AsyncOperationCopyWith<T, $Res> {
  factory _$IdleCopyWith(_Idle<T> value, $Res Function(_Idle<T>) _then) = __$IdleCopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class __$IdleCopyWithImpl<T,$Res>
    implements _$IdleCopyWith<T, $Res> {
  __$IdleCopyWithImpl(this._self, this._then);

  final _Idle<T> _self;
  final $Res Function(_Idle<T>) _then;

/// Create a copy of AsyncOperation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_Idle<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
