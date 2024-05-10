import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/repositories/user_settings_repository_impl.dart';
import 'package:chit_app_clean/src/domain/repositories/user_settings_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

void setup() {
  final appDatabase = AppDatabase();

  locator.registerSingleton<UserSettingsRepository>(
    UserSettingsRepositoryImplementation(appDatabase),
  );
}
