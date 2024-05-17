import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';

abstract interface class ChitRepository {
  Stream<List<ChitWithDates>> watchChits();
  Future<DataState<ChitModel>> createChit(ChitModel newChit);
  Future<DataState<void>> editChit(ChitModel newChit);
  Future<DataState<void>> setDates(List<DateTime> dates, int chitId);
  Future<List<DateTime>> getDates(int chitId);
}
