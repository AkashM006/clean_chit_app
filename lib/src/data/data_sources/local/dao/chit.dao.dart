import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_dates.schema.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_payments.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:drift/drift.dart';

part 'chit.dao.g.dart';

@DriftAccessor(tables: [
  Chits,
  ChitDates,
  ChitPayments,
])
class ChitDao extends DatabaseAccessor<AppDatabase> with _$ChitDaoMixin {
  ChitDao(super.db);

  Stream<List<ChitModel>> watchChits() {
    final query = select(chits).join([
      leftOuterJoin(chitDates, chitDates.belongsTo.equalsExp(chits.id)),
    ]);

    return query.watch().map((rows) {
      final Map<int, List<ChitDate>> grouped = {};

      for (final row in rows) {
        final chit = row.readTable(chits);
        final date = row.readTableOrNull(chitDates);

        if (date != null) grouped.putIfAbsent(chit.id, () => []).add(date);
      }

      return grouped.entries.map((entry) {
        final chitResult = rows
            .firstWhere((row) => row.readTable(chits).id == entry.key)
            .readTable(chits);
        final chitModel = chitToModel(chitResult).copyWith(
          dates: entry.value.map((e) => chitDateToModel(e)).toList(),
        );
        return chitModel;
      }).toList();
    });
  }

  // Stream<ChitModel> watchChit(int id) {
  void watchChit(int id) {
    // (select(chits)..where((t) => t.id.equals(id))).watchSingle().map((row) {
    final query = select(chits).join([
      leftOuterJoin(chitDates, chitDates.belongsTo.equalsExp(chits.id)),
      leftOuterJoin(chitPayments, chitPayments.belongsTo.equalsExp(chits.id)),
    ]);
  }

  Future<void> insertChit(ChitModel chit) async {
    await transaction(() async {
      final result = await into(chits).insertReturning(
        modelToChitsCompanion(chit),
      );
      await batch((batch) => batch.insertAll(
            chitDates,
            chitDateListToCompanionsList(chit.dates, result.id),
          ));
    });
  }

  Future<void> editChit(ChitModel chit) async {
    await transaction(() async {
      await update(chits).replace(modelToChit(chit));
      await (delete(chitDates)..where((tbl) => tbl.belongsTo.equals(chit.id)))
          .go();
      await batch(
        (batch) => batch.insertAll(
          chitDates,
          chitDateListToCompanionsList(chit.dates, chit.id),
        ),
      );
    });
  }
}
