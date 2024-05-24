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

  Future<void> addPayments(ChitPaymentsModel chitPayment) async {
    await into(chitPayments).insert(ChitPaymentsCompanion(
      paidAmount: Value(chitPayment.paidAmount),
      receivedAmount: Value(chitPayment.receivedAmount),
      paymentDate: Value(chitPayment.paymentDate),
      belongsTo: Value(chitPayment.chit.id),
      paymentType: Value(chitPayment.paymentType),
    ));
  }
}
