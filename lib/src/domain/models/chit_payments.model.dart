import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chit_payments.model.freezed.dart';

enum PaymentType {
  receipt,
  payment,
}

@freezed
class ChitPaymentModel with _$ChitPaymentModel {
  const ChitPaymentModel._();

  const factory ChitPaymentModel({
    @Default(-1) int id,
    required DateTime paymentDate,
    required int paidAmount,
    required int receivedAmount,
    required PaymentType paymentType,
    @Default(null) DateTime? createdAt,
  }) = _ChitPaymentModel;

  Map<String, String> asMap() {
    return {
      "Payment Date": getFormattedDate(paymentDate),
      "Paid Amount": getFormattedCurrency(paidAmount),
      "Received Amount": getFormattedCurrency(receivedAmount),
      "Payment Type": capitalize(paymentType.name)
    };
  }
}

@freezed
class ChitPaymentWithChitNameAndIdModel
    with _$ChitPaymentWithChitNameAndIdModel {
  const factory ChitPaymentWithChitNameAndIdModel({
    required ChitPaymentModel chitPayment,
    required ChitNameAndId chit,
    @Default(null) DateTime? createdAt,
  }) = _ChitPaymentWithChitNameAndIdModel;
}
