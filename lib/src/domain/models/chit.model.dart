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

  static bool equals(ChitModel a, ChitModel b) {
    final areDetailsEqual = a.amount == b.amount &&
        a.commissionPercentage == b.commissionPercentage &&
        a.fManAuctionNumber == b.fManAuctionNumber &&
        a.frequencyNumber == b.frequencyNumber &&
        a.frequencyType == b.frequencyType &&
        a.id == b.id &&
        a.name == b.name &&
        a.people == b.people &&
        compareDates(a.startDate, b.startDate) &&
        compareDates(a.endDate, b.endDate);
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
    final areDetailsEqual = ChitModel.equals(a, b);
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
  const factory ChitNameAndId({
    required int id,
    required String name,
  }) = $ChitNameAndId;
}

@freezed
class ChitDetailWithDatesAndPayments with _$ChitDetailWithDatesAndPayments {
  const factory ChitDetailWithDatesAndPayments({
    required ChitModel chit,
    required List<DateTime> chitDates,
    required List<ChitPaymentModel> chitPayments,
  }) = $ChitDetailWithDatesAndPayments;
}
