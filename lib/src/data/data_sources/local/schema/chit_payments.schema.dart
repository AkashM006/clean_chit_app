// ignore_for_file: recursive_getters

import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:drift/drift.dart';

class ChitPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get paymentDate => dateTime()();
  RealColumn get paidAmount => real()();
  RealColumn get receivedAmount => real()();
  IntColumn get belongsTo =>
      integer().references(Chits, #id, onDelete: KeyAction.cascade)();
  IntColumn get paymentType => intEnum<PaymentType>()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
