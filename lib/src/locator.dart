import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/repositories/chit_payments/chit_payment_repository.impl.dart';
import 'package:chit_app_clean/src/data/repositories/chits/chit_repository_impl.dart';
import 'package:chit_app_clean/src/data/repositories/user_settings/user_settings_repository_impl.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_payments_repository.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_repository.dart';
import 'package:chit_app_clean/src/domain/repositories/user_settings_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

void setup() {
  final appDatabase = AppDatabase();

  locator.registerSingleton<UserSettingsRepository>(
    UserSettingsRepositoryImplementation(appDatabase),
  );

  locator.registerSingleton<ChitRepository>(
    ChitRepositoryImplementation(appDatabase),
  );

  locator.registerSingleton<ChitPaymentRepository>(
    ChitPaymentRepositoryImplementation(appDatabase),
  );
}
