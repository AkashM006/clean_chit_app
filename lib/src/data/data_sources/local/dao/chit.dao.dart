import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_dates.schema.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_payments.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/classes/errors.dart';
import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';

part 'chit.dao.g.dart';

@DriftAccessor(tables: [
  Chits,
  ChitDates,
  ChitPayments,
])
class ChitDao extends DatabaseAccessor<AppDatabase> with _$ChitDaoMixin {
  ChitDao(super.db);

  Stream<List<ChitWithDates>> watchChits() {
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
        final chitModel = chitToModel(chitResult);
        final chitDates = entry.value.map((e) => chitDateToModel(e)).toList();
        final result = ChitWithDates(chit: chitModel, dates: chitDates);
        return result;
      }).toList();
    });
  }

  Stream<ChitDetailWithDatesAndPayments> watchChit(int id) {
    final chitQuery = select(chits)..where((tbl) => tbl.id.equals(id));

    final chitPaymentsQuery = select(chits).join([
      leftOuterJoin(chitPayments, chitPayments.belongsTo.equalsExp(chits.id)),
    ])
      ..where(chits.id.equals(id));

    final chitDatesQuery = select(chits).join([
      leftOuterJoin(chitDates, chitDates.belongsTo.equalsExp(chits.id)),
    ])
      ..where(chits.id.equals(id));

    final chitStream = chitQuery.watchSingle();

    final chitDatesStream = chitDatesQuery.watch().map((rows) {
      return rows
          .map((row) => chitDateToModel(row.readTable(chitDates)))
          .toList();
    });

    final chitPaymentsStream = chitPaymentsQuery.watch().map((rows) {
      final List<ChitPayment> result = [];
      for (final row in rows) {
        final payment = row.readTableOrNull(chitPayments);
        if (payment != null) result.add(payment);
      }
      return result;
    });

    return Rx.combineLatest3(
      chitStream,
      chitDatesStream,
      chitPaymentsStream,
      (
        Chit chit,
        List<DateTime> chitDates,
        List<ChitPayment> chitPayments,
      ) {
        return ChitDetailWithDatesAndPayments(
          chit: chitToModel(chit),
          chitDates: chitDates,
          chitPayments: chitPayments
              .map((payment) => chitPaymentToModel(payment))
              .toList(),
        );
      },
    );
  }

  Future<void> insertChit(ChitWithDates chitWithDates) async {
    await transaction(() async {
      final result = await into(chits).insertReturning(
        modelToChitsCompanion(chitWithDates.chit),
      );
      await batch((batch) => batch.insertAll(
            chitDates,
            chitDateListToCompanionsList(chitWithDates.dates, result.id),
          ));
    });
  }

  Future<void> editChit(ChitWithDates chitWithDates) async {
    await transaction(() async {
      await update(chits).replace(modelToChit(chitWithDates.chit));
      await (delete(chitDates)
            ..where((tbl) => tbl.belongsTo.equals(chitWithDates.chit.id)))
          .go();
      await batch(
        (batch) => batch.insertAll(
          chitDates,
          chitDateListToCompanionsList(
            chitWithDates.dates,
            chitWithDates.chit.id,
          ),
        ),
      );
    });
  }

  Future<void> deleteChit(int chitId) async {
    final result =
        await (delete(chits)..where((row) => row.id.equals(chitId))).go();

    if (result == 0) {
      throw const AppError(
        message:
            "Something went wrong when trying to delete the chit. Please try again later!",
      );
    }
  }
}
