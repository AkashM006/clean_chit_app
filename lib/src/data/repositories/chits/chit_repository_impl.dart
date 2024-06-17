import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/repositories/base/base_db_repository.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/repositories/chit_repository.dart';
import 'package:chit_app_clean/src/locator.dart';
import 'package:chit_app_clean/src/utils/classes/data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chit_repository_impl.g.dart';

class ChitRepositoryImplementation extends BaseDbRepository
    implements ChitRepository {
  final AppDatabase _appDatabase;

  const ChitRepositoryImplementation(this._appDatabase);

  @override
  Stream<List<ChitWithDates>> watchChits() {
    return _appDatabase.chitDao.watchChits();
  }

  @override
  Stream<ChitModel> watchChit(int id) {
    // TODO: implement getChit
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> createChit(ChitWithDates newChit) {
    return safeExecute(() => _appDatabase.chitDao.insertChit(newChit));
  }

  @override
  Future<DataState<void>> editChit(ChitWithDates newChit) {
    return safeExecute(() => _appDatabase.chitDao.editChit(newChit));
  }
}

@riverpod
Stream<List<ChitWithDates>> chits(ChitsRef ref) {
  final chitRepository = locator<ChitRepository>();

  return chitRepository.watchChits();
}
