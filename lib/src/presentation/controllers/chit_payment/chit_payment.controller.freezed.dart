// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chit_payment.controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChitPaymentControllerState {
  ControllerState<dynamic> get createChitPayment =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChitPaymentControllerStateCopyWith<ChitPaymentControllerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChitPaymentControllerStateCopyWith<$Res> {
  factory $ChitPaymentControllerStateCopyWith(ChitPaymentControllerState value,
          $Res Function(ChitPaymentControllerState) then) =
      _$ChitPaymentControllerStateCopyWithImpl<$Res,
          ChitPaymentControllerState>;
  @useResult
  $Res call({ControllerState<dynamic> createChitPayment});

  $ControllerStateCopyWith<dynamic, $Res> get createChitPayment;
}

/// @nodoc
class _$ChitPaymentControllerStateCopyWithImpl<$Res,
        $Val extends ChitPaymentControllerState>
    implements $ChitPaymentControllerStateCopyWith<$Res> {
  _$ChitPaymentControllerStateCopyWithImpl(this._value, this._then);

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
abstract class _$$$ChitPaymentControllerStateImplCopyWith<$Res>
    implements $ChitPaymentControllerStateCopyWith<$Res> {
  factory _$$$ChitPaymentControllerStateImplCopyWith(
          _$$ChitPaymentControllerStateImpl value,
          $Res Function(_$$ChitPaymentControllerStateImpl) then) =
      __$$$ChitPaymentControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ControllerState<dynamic> createChitPayment});

  @override
  $ControllerStateCopyWith<dynamic, $Res> get createChitPayment;
}

/// @nodoc
class __$$$ChitPaymentControllerStateImplCopyWithImpl<$Res>
    extends _$ChitPaymentControllerStateCopyWithImpl<$Res,
        _$$ChitPaymentControllerStateImpl>
    implements _$$$ChitPaymentControllerStateImplCopyWith<$Res> {
  __$$$ChitPaymentControllerStateImplCopyWithImpl(
      _$$ChitPaymentControllerStateImpl _value,
      $Res Function(_$$ChitPaymentControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createChitPayment = null,
  }) {
    return _then(_$$ChitPaymentControllerStateImpl(
      createChitPayment: null == createChitPayment
          ? _value.createChitPayment
          : createChitPayment // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
    ));
  }
}

/// @nodoc

class _$$ChitPaymentControllerStateImpl implements $ChitPaymentControllerState {
  const _$$ChitPaymentControllerStateImpl(
      {this.createChitPayment = const ControllerState()});

  @override
  @JsonKey()
  final ControllerState<dynamic> createChitPayment;

  @override
  String toString() {
    return 'ChitPaymentControllerState(createChitPayment: $createChitPayment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$ChitPaymentControllerStateImpl &&
            (identical(other.createChitPayment, createChitPayment) ||
                other.createChitPayment == createChitPayment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createChitPayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$ChitPaymentControllerStateImplCopyWith<_$$ChitPaymentControllerStateImpl>
      get copyWith => __$$$ChitPaymentControllerStateImplCopyWithImpl<
          _$$ChitPaymentControllerStateImpl>(this, _$identity);
}

abstract class $ChitPaymentControllerState
    implements ChitPaymentControllerState {
  const factory $ChitPaymentControllerState(
          {final ControllerState<dynamic> createChitPayment}) =
      _$$ChitPaymentControllerStateImpl;

  @override
  ControllerState<dynamic> get createChitPayment;
  @override
  @JsonKey(ignore: true)
  _$$$ChitPaymentControllerStateImplCopyWith<_$$ChitPaymentControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
