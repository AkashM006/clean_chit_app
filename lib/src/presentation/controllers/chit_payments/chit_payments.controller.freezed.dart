// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chit_payments.controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChitPaymentsControllerState {
  ControllerState<dynamic> get createChitPayment =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChitPaymentsControllerStateCopyWith<ChitPaymentsControllerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChitPaymentsControllerStateCopyWith<$Res> {
  factory $ChitPaymentsControllerStateCopyWith(
          ChitPaymentsControllerState value,
          $Res Function(ChitPaymentsControllerState) then) =
      _$ChitPaymentsControllerStateCopyWithImpl<$Res,
          ChitPaymentsControllerState>;
  @useResult
  $Res call({ControllerState<dynamic> createChitPayment});

  $ControllerStateCopyWith<dynamic, $Res> get createChitPayment;
}

/// @nodoc
class _$ChitPaymentsControllerStateCopyWithImpl<$Res,
        $Val extends ChitPaymentsControllerState>
    implements $ChitPaymentsControllerStateCopyWith<$Res> {
  _$ChitPaymentsControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createChitPayment = null,
  }) {
    return _then(_value.copyWith(
      createChitPayment: null == createChitPayment
          ? _value.createChitPayment
          : createChitPayment // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<dynamic, $Res> get createChitPayment {
    return $ControllerStateCopyWith<dynamic, $Res>(_value.createChitPayment,
        (value) {
      return _then(_value.copyWith(createChitPayment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$ChitPaymentsControllerStateImplCopyWith<$Res>
    implements $ChitPaymentsControllerStateCopyWith<$Res> {
  factory _$$$ChitPaymentsControllerStateImplCopyWith(
          _$$ChitPaymentsControllerStateImpl value,
          $Res Function(_$$ChitPaymentsControllerStateImpl) then) =
      __$$$ChitPaymentsControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ControllerState<dynamic> createChitPayment});

  @override
  $ControllerStateCopyWith<dynamic, $Res> get createChitPayment;
}

/// @nodoc
class __$$$ChitPaymentsControllerStateImplCopyWithImpl<$Res>
    extends _$ChitPaymentsControllerStateCopyWithImpl<$Res,
        _$$ChitPaymentsControllerStateImpl>
    implements _$$$ChitPaymentsControllerStateImplCopyWith<$Res> {
  __$$$ChitPaymentsControllerStateImplCopyWithImpl(
      _$$ChitPaymentsControllerStateImpl _value,
      $Res Function(_$$ChitPaymentsControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createChitPayment = null,
  }) {
    return _then(_$$ChitPaymentsControllerStateImpl(
      createChitPayment: null == createChitPayment
          ? _value.createChitPayment
          : createChitPayment // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
    ));
  }
}

/// @nodoc

class _$$ChitPaymentsControllerStateImpl
    implements $ChitPaymentsControllerState {
  const _$$ChitPaymentsControllerStateImpl(
      {this.createChitPayment = const ControllerState()});

  @override
  @JsonKey()
  final ControllerState<dynamic> createChitPayment;

  @override
  String toString() {
    return 'ChitPaymentsControllerState(createChitPayment: $createChitPayment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ChitPaymentsControllerStateImpl &&
            (identical(other.createChitPayment, createChitPayment) ||
                other.createChitPayment == createChitPayment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createChitPayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ChitPaymentsControllerStateImplCopyWith<
          _$$ChitPaymentsControllerStateImpl>
      get copyWith => __$$$ChitPaymentsControllerStateImplCopyWithImpl<
          _$$ChitPaymentsControllerStateImpl>(this, _$identity);
}

abstract class $ChitPaymentsControllerState
    implements ChitPaymentsControllerState {
  const factory $ChitPaymentsControllerState(
          {final ControllerState<dynamic> createChitPayment}) =
      _$$ChitPaymentsControllerStateImpl;

  @override
  ControllerState<dynamic> get createChitPayment;
  @override
  @JsonKey(ignore: true)
  _$$$ChitPaymentsControllerStateImplCopyWith<
          _$$ChitPaymentsControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
