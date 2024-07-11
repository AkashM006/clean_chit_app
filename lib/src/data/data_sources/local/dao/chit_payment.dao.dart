import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_payments.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/utils/classes/errors.dart';
import 'package:drift/drift.dart';

part 'chit_payment.dao.g.dart';

@DriftAccessor(tables: [Chits, ChitPayments])
class ChitPaymentDao extends DatabaseAccessor<AppDatabase>
    with _$ChitPaymentDaoMixin {
  ChitPaymentDao(super.db);

  Stream<List<ChitPaymentWithChitNameAndIdModel>> watchChitPayments() {
    final query = select(chitPayments).join([
      leftOuterJoin(chits, chitPayments.belongsTo.equalsExp(chits.id)),
    ]);

    return query.watch().map((rows) {
      final Map<int, Chit> grouped = {};

      for (final row in rows) {
        final payment = row.readTable(chitPayments);
        final chit = row.readTableOrNull(chits);

        if (chit != null) grouped[payment.id] = chit;
      }

      return grouped.entries.map((entry) {
        final chitPaymentResult = rows
            .firstWhere((row) => row.readTable(chitPayments).id == entry.key)
            .readTable(chitPayments);
        final chit = chitToModel(entry.value);
        final chitNameAndid = ChitNameAndId(id: chit.id, name: chit.name);
        return ChitPaymentWithChitNameAndIdModel(
          chitPayment: chitPaymentToModel(chitPaymentResult),
          chit: chitNameAndid,
        );
      }).toList();
    });
  }

  Stream<ChitPaymentWithChitNameAndIdModel> watchChitPayment(
    int chitPaymentId,
  ) {
    final query = select(chitPayments).join([
      leftOuterJoin(chits, chitPayments.belongsTo.equalsExp(chits.id)),
    ])
      ..where(chitPayments.id.equals(chitPaymentId));

    return query.watch().map(
      (rows) {
        final row = rows.first;

        final chitPayment = row.readTable(chitPayments);
        final chit = row.readTable(chits);

        return chitPaymentsWithChitToModel(chitPayment, chit);
      },
    );
  }

  Future<List<ChitNameAndId>> getChitNamesAndIds() async {
    final query = selectOnly(chits)..addColumns([chits.id, chits.name]);

    final results = await query
        .map(
          (row) => ChitNameAndId(
            id: row.read<int>(chits.id) ?? -1,
            name: row.read<String>(chits.name) ?? "",
          ),
        )
        .get();

    return results;
  }

  Future<void> insertPayment(
    ChitPaymentWithChitNameAndIdModel chitPaymentWithChit,
  ) async {
    await into(chitPayments).insert(ChitPaymentsCompanion(
      paidAmount: Value(chitPaymentWithChit.chitPayment.paidAmount),
      receivedAmount: Value(chitPaymentWithChit.chitPayment.receivedAmount),
      paymentDate: Value(chitPaymentWithChit.chitPayment.paymentDate),
      belongsTo: Value(chitPaymentWithChit.chit.id),
      paymentType: Value(chitPaymentWithChit.chitPayment.paymentType),
    ));
  }

  Future<void> editChitPayment(
    ChitPaymentWithChitNameAndIdModel chitPaymentWithChitNameAndIdModel,
  ) async {
    await update(chitPayments)
        .replace(modelToChitPayment(chitPaymentWithChitNameAndIdModel));
  }

  Future<void> deletePayment(int chitPaymentId) async {
    final result = await (delete(chitPayments)
          ..where((row) => row.id.equals(chitPaymentId)))
        .go();

    if (result == 0) {
      throw const AppError(
        message:
            "Something went wrong when trying to delete the chit payment. Please try again later!",
      );
    }
  }
}
