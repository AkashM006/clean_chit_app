// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chit_payments.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChitPaymentsModel {
  int get id => throw _privateConstructorUsedError;
  DateTime get paymentDate => throw _privateConstructorUsedError;
  double get paidAmount => throw _privateConstructorUsedError;
  double get receivedAmount => throw _privateConstructorUsedError;
  ChitModel get chit => throw _privateConstructorUsedError;
  PaymentType get paymentType => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChitPaymentsModelCopyWith<ChitPaymentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChitPaymentsModelCopyWith<$Res> {
  factory $ChitPaymentsModelCopyWith(
          ChitPaymentsModel value, $Res Function(ChitPaymentsModel) then) =
      _$ChitPaymentsModelCopyWithImpl<$Res, ChitPaymentsModel>;
  @useResult
  $Res call(
      {int id,
      DateTime paymentDate,
      double paidAmount,
      double receivedAmount,
      ChitModel chit,
      PaymentType paymentType,
      DateTime createdAt});

  $ChitModelCopyWith<$Res> get chit;
}

/// @nodoc
class _$ChitPaymentsModelCopyWithImpl<$Res, $Val extends ChitPaymentsModel>
    implements $ChitPaymentsModelCopyWith<$Res> {
  _$ChitPaymentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentDate = null,
    Object? paidAmount = null,
    Object? receivedAmount = null,
    Object? chit = null,
    Object? paymentType = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      chit: null == chit
          ? _value.chit
          : chit // ignore: cast_nullable_to_non_nullable
              as ChitModel,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChitModelCopyWith<$Res> get chit {
    return $ChitModelCopyWith<$Res>(_value.chit, (value) {
      return _then(_value.copyWith(chit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChitPaymentsModelImplCopyWith<$Res>
    implements $ChitPaymentsModelCopyWith<$Res> {
  factory _$$ChitPaymentsModelImplCopyWith(_$ChitPaymentsModelImpl value,
          $Res Function(_$ChitPaymentsModelImpl) then) =
      __$$ChitPaymentsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime paymentDate,
      double paidAmount,
      double receivedAmount,
      ChitModel chit,
      PaymentType paymentType,
      DateTime createdAt});

  @override
  $ChitModelCopyWith<$Res> get chit;
}

/// @nodoc
class __$$ChitPaymentsModelImplCopyWithImpl<$Res>
    extends _$ChitPaymentsModelCopyWithImpl<$Res, _$ChitPaymentsModelImpl>
    implements _$$ChitPaymentsModelImplCopyWith<$Res> {
  __$$ChitPaymentsModelImplCopyWithImpl(_$ChitPaymentsModelImpl _value,
      $Res Function(_$ChitPaymentsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentDate = null,
    Object? paidAmount = null,
    Object? receivedAmount = null,
    Object? chit = null,
    Object? paymentType = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChitPaymentsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as double,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      chit: null == chit
          ? _value.chit
          : chit // ignore: cast_nullable_to_non_nullable
              as ChitModel,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChitPaymentsModelImpl implements _ChitPaymentsModel {
  const _$ChitPaymentsModelImpl(
      {this.id = -1,
      required this.paymentDate,
      required this.paidAmount,
      required this.receivedAmount,
      required this.chit,
      required this.paymentType,
      required this.createdAt});

  @override
  @JsonKey()
  final int id;
  @override
  final DateTime paymentDate;
  @override
  final double paidAmount;
  @override
  final double receivedAmount;
  @override
  final ChitModel chit;
  @override
  final PaymentType paymentType;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChitPaymentsModel(id: $id, paymentDate: $paymentDate, paidAmount: $paidAmount, receivedAmount: $receivedAmount, chit: $chit, paymentType: $paymentType, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChitPaymentsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.receivedAmount, receivedAmount) ||
                other.receivedAmount == receivedAmount) &&
            (identical(other.chit, chit) || other.chit == chit) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, paymentDate, paidAmount,
      receivedAmount, chit, paymentType, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChitPaymentsModelImplCopyWith<_$ChitPaymentsModelImpl> get copyWith =>
      __$$ChitPaymentsModelImplCopyWithImpl<_$ChitPaymentsModelImpl>(
          this, _$identity);
}

abstract class _ChitPaymentsModel implements ChitPaymentsModel {
  const factory _ChitPaymentsModel(
      {final int id,
      required final DateTime paymentDate,
      required final double paidAmount,
      required final double receivedAmount,
      required final ChitModel chit,
      required final PaymentType paymentType,
      required final DateTime createdAt}) = _$ChitPaymentsModelImpl;

  @override
  int get id;
  @override
  DateTime get paymentDate;
  @override
  double get paidAmount;
  @override
  double get receivedAmount;
  @override
  ChitModel get chit;
  @override
  PaymentType get paymentType;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ChitPaymentsModelImplCopyWith<_$ChitPaymentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
