import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/user_settings.schema.dart';
import 'package:drift/drift.dart';

part 'user_settings.dao.g.dart';

@DriftAccessor(tables: [UserSettings])
class UserSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$UserSettingsDaoMixin {
  UserSettingsDao(super.db);

  Future<UserSetting?> getUserSettings() async {
    final query = select(userSettings)..where((tbl) => tbl.id.equals(0));
    return query.getSingleOrNull();
  }

  Future<void> updateUserSettings(String newSettings) async {
    into(userSettings).insertOnConflictUpdate(UserSettingsCompanion(
      id: const Value(0),
      settings: Value(newSettings),
    ));
  }
}
