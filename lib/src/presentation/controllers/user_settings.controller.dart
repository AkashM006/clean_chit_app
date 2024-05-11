import 'package:chit_app_clean/src/domain/models/user_settings.model.dart';
import 'package:chit_app_clean/src/domain/repositories/user_settings_repository.dart';
import 'package:chit_app_clean/src/utils/classes/controller_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chit_app_clean/src/locator.dart';

part 'user_settings.controller.freezed.dart';
part 'user_settings.controller.g.dart';

@freezed
class UserSettingsControllerState with _$UserSettingsControllerState {
  const factory UserSettingsControllerState({
    @Default(ControllerState()) ControllerState updateUserSettings,
  }) = $UserSettingsControllerState;
}

@riverpod
class UserSettingsController extends _$UserSettingsController {
  final userSettingsRepository = locator<UserSettingsRepository>();

  @override
  UserSettingsControllerState build() {
    return const UserSettingsControllerState();
  }

  void updateUserSettings(UserSettingsModel newUserSettings) async {
    state = state.copyWith(
      updateUserSettings: state.updateUserSettings.setLoading(),
    );

    await Future.delayed(const Duration(seconds: 3));

    final result =
        await userSettingsRepository.updateUserSettings(newUserSettings);

    state = result.fold(
      () => state.copyWith(
        updateUserSettings: state.updateUserSettings.setSuccess(null),
      ),
      (error) => state.copyWith(
        updateUserSettings:
            state.updateUserSettings.setFailure(error.toString()),
      ),
    );
  }
}
