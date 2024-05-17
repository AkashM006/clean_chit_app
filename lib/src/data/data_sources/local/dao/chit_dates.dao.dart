import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_dates.schema.dart';
import 'package:drift/drift.dart';

part 'chit_dates.dao.g.dart';

@DriftAccessor(tables: [ChitDates])
class ChitDatesDao extends DatabaseAccessor<AppDatabase>
    with _$ChitDatesDaoMixin {
  ChitDatesDao(super.db);

  Future<List<ChitDate>> getDates(int id) async {
    return await (select(chitDates)
          ..where((tbl) => tbl.belongsTo.equals(id))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.id)]))
        .get();
  }

  Future<void> addDates(List<DateTime> dates, int id) async {
    final dateCompanions = dates
        .map(
          (e) => ChitDatesCompanion(
            date: Value(e),
            belongsTo: Value(id),
          ),
        )
        .toList();
    await batch((batch) => batch.insertAll(chitDates, dateCompanions));
  }
}
