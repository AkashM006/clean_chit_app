// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ControllerState<T> {
  String get message => throw _privateConstructorUsedError;
  ControllerStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ControllerStateCopyWith<T, ControllerState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControllerStateCopyWith<T, $Res> {
  factory $ControllerStateCopyWith(
          ControllerState<T> value, $Res Function(ControllerState<T>) then) =
      _$ControllerStateCopyWithImpl<T, $Res, ControllerState<T>>;
  @useResult
  $Res call({String message, ControllerStatus status});
}

/// @nodoc
class _$ControllerStateCopyWithImpl<T, $Res, $Val extends ControllerState<T>>
    implements $ControllerStateCopyWith<T, $Res> {
  _$ControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ControllerStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ControllerStateImplCopyWith<T, $Res>
    implements $ControllerStateCopyWith<T, $Res> {
  factory _$$ControllerStateImplCopyWith(_$ControllerStateImpl<T> value,
          $Res Function(_$ControllerStateImpl<T>) then) =
      __$$ControllerStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, ControllerStatus status});
}

/// @nodoc
class __$$ControllerStateImplCopyWithImpl<T, $Res>
    extends _$ControllerStateCopyWithImpl<T, $Res, _$ControllerStateImpl<T>>
    implements _$$ControllerStateImplCopyWith<T, $Res> {
  __$$ControllerStateImplCopyWithImpl(_$ControllerStateImpl<T> _value,
      $Res Function(_$ControllerStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$ControllerStateImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ControllerStatus,
    ));
  }
}

/// @nodoc

class _$ControllerStateImpl<T> extends _ControllerState<T> {
  const _$ControllerStateImpl(
      {this.message = '', this.status = ControllerStatus.init})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final ControllerStatus status;

  @override
  String toString() {
    return 'ControllerState<$T>(message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControllerStateImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ControllerStateImplCopyWith<T, _$ControllerStateImpl<T>> get copyWith =>
      __$$ControllerStateImplCopyWithImpl<T, _$ControllerStateImpl<T>>(
          this, _$identity);
}

abstract class _ControllerState<T> extends ControllerState<T> {
  const factory _ControllerState(
      {final String message,
      final ControllerStatus status}) = _$ControllerStateImpl<T>;
  const _ControllerState._() : super._();

  @override
  String get message;
  @override
  ControllerStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$ControllerStateImplCopyWith<T, _$ControllerStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
