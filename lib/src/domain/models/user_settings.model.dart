import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.model.freezed.dart';
part 'user_settings.model.g.dart';

enum LoginType {
  notSet,
  deviceLock,
  customPin,
}

@freezed
class UserSettingsModel with _$UserSettingsModel {
  const UserSettingsModel._();
  const factory UserSettingsModel({
    required LoginType loginType,
    @Default("") String userPin,
  }) = _UserSettingsModel;

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsModelFromJson(json);

  static UserSettingsModel get placeholder =>
      const UserSettingsModel(loginType: LoginType.notSet);

  bool get hasSetupLogin => loginType != LoginType.notSet;
  bool get isCustomPinLock => loginType == LoginType.customPin;
  bool get isDeviceLock => loginType == LoginType.deviceLock;
}
