import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';

abstract interface class ChitRepository {
  Stream<List<ChitModel>> watchChits();
  Stream<ChitModel> watchChit(int id);
  Future<DataState<void>> createChit(ChitModel newChit);
  Future<DataState<void>> editChit(ChitModel newChit);
}
