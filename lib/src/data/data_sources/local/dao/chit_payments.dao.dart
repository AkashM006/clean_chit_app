import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit_payments.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:drift/drift.dart';

part 'chit_payments.dao.g.dart';

@DriftAccessor(tables: [Chits, ChitPayments])
class ChitPaymentsDao extends DatabaseAccessor<AppDatabase>
    with _$ChitPaymentsDaoMixin {
  ChitPaymentsDao(super.db);

  Stream<List<ChitPaymentWithChitNameAndIdModel>> watchChitPayments() {
    final query = select(chitPayments).join([
      leftOuterJoin(chits, chitPayments.belongsTo.equalsExp(chits.id)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final chitPayment = row.readTable(chitPayments);
        final chit = row.readTable(chits);

        // return ChitPaymentWithChitNameAndIdModel(
        //   paymentDate: chitPayment.paymentDate,
        //   paidAmount: chitPayment.paidAmount,
        //   receivedAmount: chitPayment.receivedAmount,
        //   chit: ChitNameAndId(id: chit.id, name: chit.name),
        //   paymentType: chitPayment.paymentType,
        // );
        return chitPaymentsWithChitToModel(chitPayment, chit);
      }).toList();
    });
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

  Future<void> addPayments(
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
}
