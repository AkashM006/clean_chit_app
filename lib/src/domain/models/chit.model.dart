import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:chit_app_clean/src/utils/functions/formatters.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chit.model.freezed.dart';

enum FrequencyType { weekly, monthly }

extension FrequencyTypeExtension on FrequencyType {
  String get name {
    switch (this) {
      case FrequencyType.weekly:
        return 'Weekly';
      case FrequencyType.monthly:
        return 'Monthly';
    }
  }
}

@freezed
class ChitModel with _$ChitModel {
  const ChitModel._();

  const factory ChitModel({
    @Default(-1) int id,
    required String name,
    required int amount,
    required int people,
    required double commissionPercentage,
    required FrequencyType frequencyType,
    required int frequencyNumber,
    required int fManAuctionNumber,
    required DateTime startDate,
    required DateTime endDate,
    DateTime? createdAt,
  }) = _ChitModel;

  static ChitModel get placeholder => ChitModel(
        name: "",
        amount: 0,
        people: 0,
        commissionPercentage: 0,
        fManAuctionNumber: 0,
        frequencyNumber: 0,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        frequencyType: FrequencyType.monthly,
        createdAt: DateTime.now(),
      );

  bool equals(ChitModel b) {
    final areDetailsEqual = amount == b.amount &&
        commissionPercentage == b.commissionPercentage &&
        fManAuctionNumber == b.fManAuctionNumber &&
        frequencyNumber == b.frequencyNumber &&
        frequencyType == b.frequencyType &&
        id == b.id &&
        name == b.name &&
        people == b.people &&
        compareDates(startDate, b.startDate) &&
        compareDates(endDate, b.endDate);
    return areDetailsEqual;
  }

  static Map<String, String> asMap(ChitModel chit) {
    return {
      "Name": chit.name,
      "Amount": chit.amount.toString(),
      "People": chit.people.toString(),
      "Comission Percentage": "${chit.commissionPercentage.toString()} %",
      "Frequency Number": chit.frequencyNumber.toString(),
      "Frequency Type": chit.frequencyType.name,
      "Foreman Auction Number": chit.fManAuctionNumber == 0
          ? "Nil"
          : chit.fManAuctionNumber.toString(),
      "Start Date": getFormattedDate(chit.startDate),
      "End Date": getFormattedDate(chit.endDate),
    };
  }
}

@freezed
class ChitWithDates with _$ChitWithDates {
  const factory ChitWithDates({
    required ChitModel chit,
    required List<DateTime> dates,
  }) = $ChitWithDates;

  static bool equals(ChitWithDates aChit, ChitWithDates bChit) {
    final a = aChit.chit;
    final b = bChit.chit;
    final areDetailsEqual = a.equals(b);
    if (!areDetailsEqual) return false;

    return listEquals(aChit.dates, bChit.dates);
  }
}

@freezed
class ChitWithPayments with _$ChitWithPayments {
  const factory ChitWithPayments({
    required ChitModel chit,
    required List<ChitPaymentWithChitNameAndIdModel> payments,
  }) = $ChitWithPayments;
}

@freezed
class ChitNameAndId with _$ChitNameAndId {
  const ChitNameAndId._();
  const factory ChitNameAndId({
    required int id,
    required String name,
  }) = $ChitNameAndId;

  bool equals(ChitNameAndId chit) => id == chit.id && name == chit.name;
}

@freezed
class ChitDetailWithDatesAndPayments with _$ChitDetailWithDatesAndPayments {
  const factory ChitDetailWithDatesAndPayments({
    required ChitModel chit,
    required List<DateTime> chitDates,
    required List<ChitPaymentModel> chitPayments,
  }) = $ChitDetailWithDatesAndPayments;
}
