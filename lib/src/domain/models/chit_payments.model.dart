import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chit_payments.model.freezed.dart';

enum PaymentType {
  receipt,
  payment,
}

@freezed
class ChitPaymentsModel with _$ChitPaymentsModel {
  const factory ChitPaymentsModel({
    @Default(-1) int id,
    required DateTime paymentDate,
    required int paidAmount,
    required int receivedAmount,
    required ChitNameAndId chit,
    required PaymentType paymentType,
    @Default(null) DateTime? createdAt,
  }) = _ChitPaymentsModel;
}
