// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserSettingsControllerState {
  ControllerState<dynamic> get updateUserSettings =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSettingsControllerStateCopyWith<UserSettingsControllerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsControllerStateCopyWith<$Res> {
  factory $UserSettingsControllerStateCopyWith(
          UserSettingsControllerState value,
          $Res Function(UserSettingsControllerState) then) =
      _$UserSettingsControllerStateCopyWithImpl<$Res,
          UserSettingsControllerState>;
  @useResult
  $Res call({ControllerState<dynamic> updateUserSettings});

  $ControllerStateCopyWith<dynamic, $Res> get updateUserSettings;
}

/// @nodoc
class _$UserSettingsControllerStateCopyWithImpl<$Res,
        $Val extends UserSettingsControllerState>
    implements $UserSettingsControllerStateCopyWith<$Res> {
  _$UserSettingsControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUserSettings = null,
  }) {
    return _then(_value.copyWith(
      updateUserSettings: null == updateUserSettings
          ? _value.updateUserSettings
          : updateUserSettings // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ControllerStateCopyWith<dynamic, $Res> get updateUserSettings {
    return $ControllerStateCopyWith<dynamic, $Res>(_value.updateUserSettings,
        (value) {
      return _then(_value.copyWith(updateUserSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$$UserSettingsControllerStateImplCopyWith<$Res>
    implements $UserSettingsControllerStateCopyWith<$Res> {
  factory _$$$UserSettingsControllerStateImplCopyWith(
          _$$UserSettingsControllerStateImpl value,
          $Res Function(_$$UserSettingsControllerStateImpl) then) =
      __$$$UserSettingsControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ControllerState<dynamic> updateUserSettings});

  @override
  $ControllerStateCopyWith<dynamic, $Res> get updateUserSettings;
}

/// @nodoc
class __$$$UserSettingsControllerStateImplCopyWithImpl<$Res>
    extends _$UserSettingsControllerStateCopyWithImpl<$Res,
        _$$UserSettingsControllerStateImpl>
    implements _$$$UserSettingsControllerStateImplCopyWith<$Res> {
  __$$$UserSettingsControllerStateImplCopyWithImpl(
      _$$UserSettingsControllerStateImpl _value,
      $Res Function(_$$UserSettingsControllerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUserSettings = null,
  }) {
    return _then(_$$UserSettingsControllerStateImpl(
      updateUserSettings: null == updateUserSettings
          ? _value.updateUserSettings
          : updateUserSettings // ignore: cast_nullable_to_non_nullable
              as ControllerState<dynamic>,
    ));
  }
}

/// @nodoc

class _$$UserSettingsControllerStateImpl
    implements $UserSettingsControllerState {
  const _$$UserSettingsControllerStateImpl(
      {this.updateUserSettings = const ControllerState()});

  @override
  @JsonKey()
  final ControllerState<dynamic> updateUserSettings;

  @override
  String toString() {
    return 'UserSettingsControllerState(updateUserSettings: $updateUserSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$UserSettingsControllerStateImpl &&
            (identical(other.updateUserSettings, updateUserSettings) ||
                other.updateUserSettings == updateUserSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updateUserSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$UserSettingsControllerStateImplCopyWith<
          _$$UserSettingsControllerStateImpl>
      get copyWith => __$$$UserSettingsControllerStateImplCopyWithImpl<
          _$$UserSettingsControllerStateImpl>(this, _$identity);
}

abstract class $UserSettingsControllerState
    implements UserSettingsControllerState {
  const factory $UserSettingsControllerState(
          {final ControllerState<dynamic> updateUserSettings}) =
      _$$UserSettingsControllerStateImpl;

  @override
  ControllerState<dynamic> get updateUserSettings;
  @override
  @JsonKey(ignore: true)
  _$$$UserSettingsControllerStateImplCopyWith<
          _$$UserSettingsControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
