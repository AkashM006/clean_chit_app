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
      );
}
