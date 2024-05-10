import 'package:chit_app_clean/src/domain/models/user_settings.model.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';

abstract interface class UserSettingsRepository {
  Stream<UserSettingsModel> watchUserSettings();
  Future<DataState<void>> updateUserSettings(UserSettingsModel newUserSettings);
}
