import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_dates.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:drift/drift.dart';

part 'chit.dao.g.dart';

@DriftAccessor(tables: [
  Chits,
  ChitDates,
])
class ChitDao extends DatabaseAccessor<AppDatabase> with _$ChitDaoMixin {
  ChitDao(super.db);

  Stream<List<ChitWithDates>> watchChits() {
    final query = select(chits).join(
        [leftOuterJoin(chitDates, chitDates.belongsTo.equalsExp(chits.id))]);

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
        return ChitWithDates(
          chit: chitToModel(chitResult),
          dates: entry.value.map((e) => chitDateToModel(e)).toList(),
        );
      }).toList();
    });
  }

  Future<List<Chit>> getChits() async {
    return await select(chits).get();
  }

  Future<ChitModel> insertChit(ChitModel chit) async {
    final result = await into(chits).insertReturning(ChitsCompanion(
      amount: Value(chit.amount),
      commissionPercentage: Value(chit.commissionPercentage),
      createdAt: Value(DateTime.now()),
      endDate: Value(chit.endDate),
      fManAuctionNumber: Value(chit.fManAuctionNumber),
      frequencyNumber: Value(chit.frequencyNumber),
      frequencyType: Value(chit.frequencyType),
      name: Value(chit.name),
      people: Value(chit.people),
      startDate: Value(chit.startDate),
    ));

    return chitToModel(result);
  }

  Future<void> editChit(ChitModel chit) async {
    // todo: need to implement edit chit
    // also keep in mind the fact that while editing and setting new dates there might be a problem
    // delete all dates and the add all, edit is hard!
  }
}
