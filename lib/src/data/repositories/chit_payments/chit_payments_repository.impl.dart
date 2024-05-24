import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/repositories/base/base_db_repository.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_payments_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chit_payments_repository.impl.g.dart';

class ChitPaymentsRepositoryImplementation extends BaseDbRepository
    implements ChitPaymentsRepository {
  final AppDatabase _appDatabase;

  const ChitPaymentsRepositoryImplementation(this._appDatabase);

  @override
  Future<List<ChitNameAndId>> getChitNamesAndIds() {
    return _appDatabase.chitPaymentsDao.getChitNamesAndIds();
  }

  @override
  Future<DataState<void>> createChitPayments(ChitPaymentsModel chitPayment) {
    return safeExecute(
      () => _appDatabase.chitPaymentsDao.addPayments(chitPayment),
    );
  }

  @override
  Stream<List<ChitPaymentsModel>> watchChitPayments() {
    return _appDatabase.chitPaymentsDao.watchChitPayments();
  }
}

@riverpod
Stream<List<ChitPaymentsModel>> chitPayments(ChitPaymentsRef ref) {
  final chitPaymentsRepository = locator<ChitPaymentsRepository>();

  return chitPaymentsRepository.watchChitPayments();
}

@riverpod
Future<List<ChitNameAndId>> chitNamesAndIds(ChitNamesAndIdsRef ref) {
  final chitPaymentsRepository = locator<ChitPaymentsRepository>();

  return chitPaymentsRepository.getChitNamesAndIds();
}
