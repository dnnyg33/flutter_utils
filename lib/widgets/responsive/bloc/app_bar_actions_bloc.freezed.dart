// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_actions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppBarActionsEvent {

 List<AppBarWidget> get additionalActions; int get maxVisibleActions;
/// Create a copy of AppBarActionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppBarActionsEventCopyWith<AppBarActionsEvent> get copyWith => _$AppBarActionsEventCopyWithImpl<AppBarActionsEvent>(this as AppBarActionsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppBarActionsEvent&&const DeepCollectionEquality().equals(other.additionalActions, additionalActions)&&(identical(other.maxVisibleActions, maxVisibleActions) || other.maxVisibleActions == maxVisibleActions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(additionalActions),maxVisibleActions);

@override
String toString() {
  return 'AppBarActionsEvent(additionalActions: $additionalActions, maxVisibleActions: $maxVisibleActions)';
}


}

/// @nodoc
abstract mixin class $AppBarActionsEventCopyWith<$Res>  {
  factory $AppBarActionsEventCopyWith(AppBarActionsEvent value, $Res Function(AppBarActionsEvent) _then) = _$AppBarActionsEventCopyWithImpl;
@useResult
$Res call({
 List<AppBarWidget> additionalActions, int maxVisibleActions
});




}
/// @nodoc
class _$AppBarActionsEventCopyWithImpl<$Res>
    implements $AppBarActionsEventCopyWith<$Res> {
  _$AppBarActionsEventCopyWithImpl(this._self, this._then);

  final AppBarActionsEvent _self;
  final $Res Function(AppBarActionsEvent) _then;

/// Create a copy of AppBarActionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? additionalActions = null,Object? maxVisibleActions = null,}) {
  return _then(_self.copyWith(
additionalActions: null == additionalActions ? _self.additionalActions : additionalActions // ignore: cast_nullable_to_non_nullable
as List<AppBarWidget>,maxVisibleActions: null == maxVisibleActions ? _self.maxVisibleActions : maxVisibleActions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppBarActionsEvent].
extension AppBarActionsEventPatterns on AppBarActionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ComputeActions value)?  computeActions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComputeActions() when computeActions != null:
return computeActions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ComputeActions value)  computeActions,}){
final _that = this;
switch (_that) {
case _ComputeActions():
return computeActions(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ComputeActions value)?  computeActions,}){
final _that = this;
switch (_that) {
case _ComputeActions() when computeActions != null:
return computeActions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<AppBarWidget> additionalActions,  int maxVisibleActions)?  computeActions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComputeActions() when computeActions != null:
return computeActions(_that.additionalActions,_that.maxVisibleActions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<AppBarWidget> additionalActions,  int maxVisibleActions)  computeActions,}) {final _that = this;
switch (_that) {
case _ComputeActions():
return computeActions(_that.additionalActions,_that.maxVisibleActions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<AppBarWidget> additionalActions,  int maxVisibleActions)?  computeActions,}) {final _that = this;
switch (_that) {
case _ComputeActions() when computeActions != null:
return computeActions(_that.additionalActions,_that.maxVisibleActions);case _:
  return null;

}
}

}

/// @nodoc


class _ComputeActions implements AppBarActionsEvent {
  const _ComputeActions({required final  List<AppBarWidget> additionalActions, this.maxVisibleActions = 3}): _additionalActions = additionalActions;
  

 final  List<AppBarWidget> _additionalActions;
@override List<AppBarWidget> get additionalActions {
  if (_additionalActions is EqualUnmodifiableListView) return _additionalActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_additionalActions);
}

@override@JsonKey() final  int maxVisibleActions;

/// Create a copy of AppBarActionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComputeActionsCopyWith<_ComputeActions> get copyWith => __$ComputeActionsCopyWithImpl<_ComputeActions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComputeActions&&const DeepCollectionEquality().equals(other._additionalActions, _additionalActions)&&(identical(other.maxVisibleActions, maxVisibleActions) || other.maxVisibleActions == maxVisibleActions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_additionalActions),maxVisibleActions);

@override
String toString() {
  return 'AppBarActionsEvent.computeActions(additionalActions: $additionalActions, maxVisibleActions: $maxVisibleActions)';
}


}

/// @nodoc
abstract mixin class _$ComputeActionsCopyWith<$Res> implements $AppBarActionsEventCopyWith<$Res> {
  factory _$ComputeActionsCopyWith(_ComputeActions value, $Res Function(_ComputeActions) _then) = __$ComputeActionsCopyWithImpl;
@override @useResult
$Res call({
 List<AppBarWidget> additionalActions, int maxVisibleActions
});




}
/// @nodoc
class __$ComputeActionsCopyWithImpl<$Res>
    implements _$ComputeActionsCopyWith<$Res> {
  __$ComputeActionsCopyWithImpl(this._self, this._then);

  final _ComputeActions _self;
  final $Res Function(_ComputeActions) _then;

/// Create a copy of AppBarActionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? additionalActions = null,Object? maxVisibleActions = null,}) {
  return _then(_ComputeActions(
additionalActions: null == additionalActions ? _self._additionalActions : additionalActions // ignore: cast_nullable_to_non_nullable
as List<AppBarWidget>,maxVisibleActions: null == maxVisibleActions ? _self.maxVisibleActions : maxVisibleActions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$AppBarActionsState {

 List<AppBarWidget> get visibleActions; List<AppBarWidget> get overflowActions; bool get shouldUseOverflow;
/// Create a copy of AppBarActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppBarActionsStateCopyWith<AppBarActionsState> get copyWith => _$AppBarActionsStateCopyWithImpl<AppBarActionsState>(this as AppBarActionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppBarActionsState&&const DeepCollectionEquality().equals(other.visibleActions, visibleActions)&&const DeepCollectionEquality().equals(other.overflowActions, overflowActions)&&(identical(other.shouldUseOverflow, shouldUseOverflow) || other.shouldUseOverflow == shouldUseOverflow));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(visibleActions),const DeepCollectionEquality().hash(overflowActions),shouldUseOverflow);

@override
String toString() {
  return 'AppBarActionsState(visibleActions: $visibleActions, overflowActions: $overflowActions, shouldUseOverflow: $shouldUseOverflow)';
}


}

/// @nodoc
abstract mixin class $AppBarActionsStateCopyWith<$Res>  {
  factory $AppBarActionsStateCopyWith(AppBarActionsState value, $Res Function(AppBarActionsState) _then) = _$AppBarActionsStateCopyWithImpl;
@useResult
$Res call({
 List<AppBarWidget> visibleActions, List<AppBarWidget> overflowActions, bool shouldUseOverflow
});




}
/// @nodoc
class _$AppBarActionsStateCopyWithImpl<$Res>
    implements $AppBarActionsStateCopyWith<$Res> {
  _$AppBarActionsStateCopyWithImpl(this._self, this._then);

  final AppBarActionsState _self;
  final $Res Function(AppBarActionsState) _then;

/// Create a copy of AppBarActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visibleActions = null,Object? overflowActions = null,Object? shouldUseOverflow = null,}) {
  return _then(_self.copyWith(
visibleActions: null == visibleActions ? _self.visibleActions : visibleActions // ignore: cast_nullable_to_non_nullable
as List<AppBarWidget>,overflowActions: null == overflowActions ? _self.overflowActions : overflowActions // ignore: cast_nullable_to_non_nullable
as List<AppBarWidget>,shouldUseOverflow: null == shouldUseOverflow ? _self.shouldUseOverflow : shouldUseOverflow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppBarActionsState].
extension AppBarActionsStatePatterns on AppBarActionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppBarActionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppBarActionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppBarActionsState value)  $default,){
final _that = this;
switch (_that) {
case _AppBarActionsState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppBarActionsState value)?  $default,){
final _that = this;
switch (_that) {
case _AppBarActionsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppBarWidget> visibleActions,  List<AppBarWidget> overflowActions,  bool shouldUseOverflow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppBarActionsState() when $default != null:
return $default(_that.visibleActions,_that.overflowActions,_that.shouldUseOverflow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppBarWidget> visibleActions,  List<AppBarWidget> overflowActions,  bool shouldUseOverflow)  $default,) {final _that = this;
switch (_that) {
case _AppBarActionsState():
return $default(_that.visibleActions,_that.overflowActions,_that.shouldUseOverflow);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppBarWidget> visibleActions,  List<AppBarWidget> overflowActions,  bool shouldUseOverflow)?  $default,) {final _that = this;
switch (_that) {
case _AppBarActionsState() when $default != null:
return $default(_that.visibleActions,_that.overflowActions,_that.shouldUseOverflow);case _:
  return null;

}
}

}

/// @nodoc


class _AppBarActionsState implements AppBarActionsState {
  const _AppBarActionsState({final  List<AppBarWidget> visibleActions = const [], final  List<AppBarWidget> overflowActions = const [], this.shouldUseOverflow = false}): _visibleActions = visibleActions,_overflowActions = overflowActions;
  

 final  List<AppBarWidget> _visibleActions;
@override@JsonKey() List<AppBarWidget> get visibleActions {
  if (_visibleActions is EqualUnmodifiableListView) return _visibleActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visibleActions);
}

 final  List<AppBarWidget> _overflowActions;
@override@JsonKey() List<AppBarWidget> get overflowActions {
  if (_overflowActions is EqualUnmodifiableListView) return _overflowActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_overflowActions);
}

@override@JsonKey() final  bool shouldUseOverflow;

/// Create a copy of AppBarActionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppBarActionsStateCopyWith<_AppBarActionsState> get copyWith => __$AppBarActionsStateCopyWithImpl<_AppBarActionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppBarActionsState&&const DeepCollectionEquality().equals(other._visibleActions, _visibleActions)&&const DeepCollectionEquality().equals(other._overflowActions, _overflowActions)&&(identical(other.shouldUseOverflow, shouldUseOverflow) || other.shouldUseOverflow == shouldUseOverflow));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_visibleActions),const DeepCollectionEquality().hash(_overflowActions),shouldUseOverflow);

@override
String toString() {
  return 'AppBarActionsState(visibleActions: $visibleActions, overflowActions: $overflowActions, shouldUseOverflow: $shouldUseOverflow)';
}


}

/// @nodoc
abstract mixin class _$AppBarActionsStateCopyWith<$Res> implements $AppBarActionsStateCopyWith<$Res> {
  factory _$AppBarActionsStateCopyWith(_AppBarActionsState value, $Res Function(_AppBarActionsState) _then) = __$AppBarActionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppBarWidget> visibleActions, List<AppBarWidget> overflowActions, bool shouldUseOverflow
});




}
/// @nodoc
class __$AppBarActionsStateCopyWithImpl<$Res>
    implements _$AppBarActionsStateCopyWith<$Res> {
  __$AppBarActionsStateCopyWithImpl(this._self, this._then);

  final _AppBarActionsState _self;
  final $Res Function(_AppBarActionsState) _then;

/// Create a copy of AppBarActionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visibleActions = null,Object? overflowActions = null,Object? shouldUseOverflow = null,}) {
  return _then(_AppBarActionsState(
visibleActions: null == visibleActions ? _self._visibleActions : visibleActions // ignore: cast_nullable_to_non_nullable
as List<AppBarWidget>,overflowActions: null == overflowActions ? _self._overflowActions : overflowActions // ignore: cast_nullable_to_non_nullable
as List<AppBarWidget>,shouldUseOverflow: null == shouldUseOverflow ? _self.shouldUseOverflow : shouldUseOverflow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
