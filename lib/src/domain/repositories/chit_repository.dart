import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';

abstract interface class ChitRepository {
  Stream<List<ChitWithDates>> watchChits();
  Stream<ChitDetailWithDatesAndPayments> watchChit(int id);
  Future<DataState<void>> createChit(ChitWithDates newChit);
  Future<DataState<void>> editChit(ChitWithDates newChit);
}
