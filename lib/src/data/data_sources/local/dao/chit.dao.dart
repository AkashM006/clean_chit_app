import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:drift/drift.dart';

part 'chit.dao.g.dart';

@DriftAccessor(tables: [Chits])
class ChitDao extends DatabaseAccessor<AppDatabase> with _$ChitDaoMixin {
  ChitDao(super.db);

  Stream<List<Chit>> watchChits() {
    return select(chits).watch();
  }

  Future<List<Chit>> getChits() async {
    return await select(chits).get();
  }

  Future<Chit> insertChit(ChitsCompanion chit) async {
    return await into(chits).insertReturning(chit);
  }
}
