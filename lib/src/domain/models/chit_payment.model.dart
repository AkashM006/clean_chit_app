import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chit_payment.model.freezed.dart';

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
    required DateTime createdAt,
  }) = _ChitPaymentModel;

  Map<String, String> asMap() {
    return {
      "Payment Date": getFormattedDate(paymentDate),
      "Paid Amount": getFormattedCurrency(paidAmount),
      "Received Amount": getFormattedCurrency(receivedAmount),
      "Payment Type": capitalize(paymentType.name)
    };
  }

  bool equals(ChitPaymentModel newChitPayment) =>
      id == newChitPayment.id &&
      paymentDate == newChitPayment.paymentDate &&
      paidAmount == newChitPayment.paidAmount &&
      receivedAmount == newChitPayment.receivedAmount &&
      paymentType == newChitPayment.paymentType &&
      createdAt == newChitPayment.createdAt;
}

@freezed
class ChitPaymentWithChitNameAndIdModel
    with _$ChitPaymentWithChitNameAndIdModel {
  const ChitPaymentWithChitNameAndIdModel._();

  const factory ChitPaymentWithChitNameAndIdModel({
    required ChitPaymentModel chitPayment,
    required ChitNameAndId chit,
    @Default(null) DateTime? createdAt,
  }) = _ChitPaymentWithChitNameAndIdModel;

  bool equals(ChitPaymentWithChitNameAndIdModel? newChitPayment) {
    if (newChitPayment == null) return false;
    return chitPayment.equals(newChitPayment.chitPayment) &&
        chit.equals(newChitPayment.chit);
  }
}
