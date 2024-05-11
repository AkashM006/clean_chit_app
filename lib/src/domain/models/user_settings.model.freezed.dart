// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSettingsModel _$UserSettingsModelFromJson(Map<String, dynamic> json) {
  return _UserSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$UserSettingsModel {
  LoginType get loginType => throw _privateConstructorUsedError;
  String get userPin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsModelCopyWith<UserSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsModelCopyWith<$Res> {
  factory $UserSettingsModelCopyWith(
          UserSettingsModel value, $Res Function(UserSettingsModel) then) =
      _$UserSettingsModelCopyWithImpl<$Res, UserSettingsModel>;
  @useResult
  $Res call({LoginType loginType, String userPin});
}

/// @nodoc
class _$UserSettingsModelCopyWithImpl<$Res, $Val extends UserSettingsModel>
    implements $UserSettingsModelCopyWith<$Res> {
  _$UserSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginType = null,
    Object? userPin = null,
  }) {
    return _then(_value.copyWith(
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as LoginType,
      userPin: null == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingsModelImplCopyWith<$Res>
    implements $UserSettingsModelCopyWith<$Res> {
  factory _$$UserSettingsModelImplCopyWith(_$UserSettingsModelImpl value,
          $Res Function(_$UserSettingsModelImpl) then) =
      __$$UserSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginType loginType, String userPin});
}

/// @nodoc
class __$$UserSettingsModelImplCopyWithImpl<$Res>
    extends _$UserSettingsModelCopyWithImpl<$Res, _$UserSettingsModelImpl>
    implements _$$UserSettingsModelImplCopyWith<$Res> {
  __$$UserSettingsModelImplCopyWithImpl(_$UserSettingsModelImpl _value,
      $Res Function(_$UserSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginType = null,
    Object? userPin = null,
  }) {
    return _then(_$UserSettingsModelImpl(
      loginType: null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as LoginType,
      userPin: null == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsModelImpl extends _UserSettingsModel {
  const _$UserSettingsModelImpl({required this.loginType, this.userPin = ""})
      : super._();

  factory _$UserSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsModelImplFromJson(json);

  @override
  final LoginType loginType;
  @override
  @JsonKey()
  final String userPin;

  @override
  String toString() {
    return 'UserSettingsModel(loginType: $loginType, userPin: $userPin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsModelImpl &&
            (identical(other.loginType, loginType) ||
                other.loginType == loginType) &&
            (identical(other.userPin, userPin) || other.userPin == userPin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loginType, userPin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      __$$UserSettingsModelImplCopyWithImpl<_$UserSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _UserSettingsModel extends UserSettingsModel {
  const factory _UserSettingsModel(
      {required final LoginType loginType,
      final String userPin}) = _$UserSettingsModelImpl;
  const _UserSettingsModel._() : super._();

  factory _UserSettingsModel.fromJson(Map<String, dynamic> json) =
      _$UserSettingsModelImpl.fromJson;

  @override
  LoginType get loginType;
  @override
  String get userPin;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
