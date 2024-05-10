// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsModelImpl _$$UserSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSettingsModelImpl(
      loginType: $enumDecode(_$LoginTypeEnumMap, json['loginType']),
      userPin: json['userPin'] as String? ?? "",
    );

Map<String, dynamic> _$$UserSettingsModelImplToJson(
        _$UserSettingsModelImpl instance) =>
    <String, dynamic>{
      'loginType': _$LoginTypeEnumMap[instance.loginType]!,
      'userPin': instance.userPin,
    };

const _$LoginTypeEnumMap = {
  LoginType.notSet: 'notSet',
  LoginType.deviceLock: 'deviceLock',
  LoginType.customPin: 'customPin',
};
