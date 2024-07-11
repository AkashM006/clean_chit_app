// ignore_for_file: recursive_getters

import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:drift/drift.dart';

class ChitPayments extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get paymentDate => dateTime()();
  IntColumn get paidAmount => integer()();
  IntColumn get receivedAmount => integer()();
  IntColumn get belongsTo =>
      integer().references(Chits, #id, onDelete: KeyAction.cascade)();
  IntColumn get paymentType => intEnum<PaymentType>()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

ChitPaymentWithChitNameAndIdModel chitPaymentsWithChitToModel(
  ChitPayment chitPayment,
  Chit chit,
) {
  return ChitPaymentWithChitNameAndIdModel(
    chit: ChitNameAndId(id: chit.id, name: chit.name),
    chitPayment: ChitPaymentModel(
      id: chitPayment.id,
      paymentDate: chitPayment.paymentDate,
      paidAmount: chitPayment.paidAmount,
      receivedAmount: chitPayment.receivedAmount,
      paymentType: chitPayment.paymentType,
      createdAt: chitPayment.createdAt,
    ),
  );
}

ChitPaymentModel chitPaymentToModel(ChitPayment chitPayment) {
  return ChitPaymentModel(
    id: chitPayment.id,
    paymentDate: chitPayment.paymentDate,
    paidAmount: chitPayment.paidAmount,
    receivedAmount: chitPayment.receivedAmount,
    paymentType: chitPayment.paymentType,
    createdAt: chitPayment.createdAt,
  );
}

ChitPayment modelToChitPayment(
  ChitPaymentWithChitNameAndIdModel chitPaymentWithChitNameAndIdModel,
) {
  return ChitPayment(
    id: chitPaymentWithChitNameAndIdModel.chitPayment.id,
    belongsTo: chitPaymentWithChitNameAndIdModel.chit.id,
    createdAt: chitPaymentWithChitNameAndIdModel.chitPayment.createdAt,
    paidAmount: chitPaymentWithChitNameAndIdModel.chitPayment.paidAmount,
    paymentDate: chitPaymentWithChitNameAndIdModel.chitPayment.paymentDate,
    paymentType: chitPaymentWithChitNameAndIdModel.chitPayment.paymentType,
    receivedAmount:
        chitPaymentWithChitNameAndIdModel.chitPayment.receivedAmount,
  );
}
