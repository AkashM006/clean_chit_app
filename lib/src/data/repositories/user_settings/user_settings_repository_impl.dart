import 'dart:convert';

import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/repositories/base/base_db_repository.dart';
import 'package:chit_app_clean/src/domain/models/user_settings.model.dart';
import 'package:chit_app_clean/src/domain/repositories/user_settings_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_repository_impl.g.dart';

class UserSettingsRepositoryImplementation extends BaseDbRepository
    implements UserSettingsRepository {
  final AppDatabase _appDatabase;

  const UserSettingsRepositoryImplementation(this._appDatabase);

  @override
  Future<DataState<void>> updateUserSettings(
      UserSettingsModel newUserSettings) {
    return safeExecute(
      () => _appDatabase.userSettingsDao.updateUserSettings(
        jsonEncode(newUserSettings),
      ),
    );
  }

  @override
  Stream<UserSettingsModel> watchUserSettings() {
    return _appDatabase.userSettingsDao.watchUserSettings().map(
          (event) => event != null
              ? UserSettingsModel.fromJson(
                  jsonDecode(event.settings),
                )
              : UserSettingsModel.placeholder,
        );
  }
}

@riverpod
Stream<UserSettingsModel> userSettings(UserSettingsRef ref) {
  final userSettingsRepository = locator<UserSettingsRepository>();
  return userSettingsRepository.watchUserSettings();
}
