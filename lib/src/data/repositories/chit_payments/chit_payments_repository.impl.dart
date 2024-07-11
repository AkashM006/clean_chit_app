import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/repositories/base/base_db_repository.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_payments_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chit_payments_repository.impl.g.dart';

class ChitPaymentRepositoryImplementation extends BaseDbRepository
    implements ChitPaymentRepository {
  final AppDatabase _appDatabase;

  const ChitPaymentRepositoryImplementation(this._appDatabase);

  @override
  Future<List<ChitNameAndId>> getChitNamesAndIds() {
    return _appDatabase.chitPaymentDao.getChitNamesAndIds();
  }

  @override
  Future<DataState<void>> createChitPayment(
      ChitPaymentWithChitNameAndIdModel chitPayment) {
    return safeExecute(
      () => _appDatabase.chitPaymentDao.insertPayment(chitPayment),
    );
  }

  @override
  Stream<List<ChitPaymentWithChitNameAndIdModel>> watchChitPayments() {
    return _appDatabase.chitPaymentDao.watchChitPayments();
  }

  @override
  Stream<ChitPaymentWithChitNameAndIdModel> watchChitPayment(
    int chitPaymentId,
  ) {
    return _appDatabase.chitPaymentDao.watchChitPayment(chitPaymentId);
  }

  @override
  Future<DataState<void>> deleteChitPayment(int chitPaymentId) {
    return safeExecute(
      () => _appDatabase.chitPaymentDao.deletePayment(chitPaymentId),
    );
  }
}

@riverpod
Stream<List<ChitPaymentWithChitNameAndIdModel>> chitPayments(
  ChitPaymentsRef ref,
) {
  final chitPaymentsRepository = locator<ChitPaymentRepository>();

  return chitPaymentsRepository.watchChitPayments();
}

@riverpod
Stream<ChitPaymentWithChitNameAndIdModel> chitPayment(
  ChitPaymentRef ref,
  int chitPaymentId,
) {
  final chitPaymentsRepository = locator<ChitPaymentRepository>();

  return chitPaymentsRepository.watchChitPayment(chitPaymentId);
}

@riverpod
Future<List<ChitNameAndId>> chitNamesAndIds(ChitNamesAndIdsRef ref) {
  final chitPaymentsRepository = locator<ChitPaymentRepository>();

  return chitPaymentsRepository.getChitNamesAndIds();
}
