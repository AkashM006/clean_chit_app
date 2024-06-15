import 'package:chit_app_clean/src/domain/models/chit_payments.model.dart';
import 'package:chit_app_clean/src/utils/functions/date.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chit.model.freezed.dart';

enum FrequencyType { weekly, monthly }

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
    @Default([]) List<DateTime> dates,
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
        dates: [],
        createdAt: DateTime.now(),
      );

  static bool equals(ChitModel a, ChitModel b) {
    final areDetailsEqual = a.amount == b.amount &&
        a.commissionPercentage == b.commissionPercentage &&
        compareDates(a.endDate, b.endDate) &&
        a.fManAuctionNumber == b.fManAuctionNumber &&
        a.frequencyNumber == b.frequencyNumber &&
        a.frequencyType == b.frequencyType &&
        a.id == b.id &&
        a.name == b.name &&
        a.people == b.people &&
        compareDates(a.startDate, b.startDate);
    if (!areDetailsEqual) return false;

    return listEquals(a.dates, b.dates);
  }
}

@freezed
class ChitWithDates with _$ChitWithDates {
  const factory ChitWithDates({
    required ChitModel chit,
    required List<DateTime> dates,
  }) = $ChitWithDates;
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
    required List<ChitPaymentsModel> chitPayments,
  }) = $ChitDetailWithDatesAndPayments;
}
