import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';

abstract class ChitPaymentRepository {
  Stream<List<ChitPaymentWithChitNameAndIdModel>> watchChitPayments();
  Stream<ChitPaymentWithChitNameAndIdModel> watchChitPayment(int chitPaymentId);
  Future<List<ChitNameAndId>> getChitNamesAndIds();
  Future<DataState<void>> createChitPayments(
      ChitPaymentWithChitNameAndIdModel chitPayment);
}
