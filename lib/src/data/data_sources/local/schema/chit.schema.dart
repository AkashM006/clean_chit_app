// ignore_for_file: recursive_getters

import 'package:drift/drift.dart';

enum FrequencyType { weekly, monthly }

class Chits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get amount => integer()();
  IntColumn get people => integer()
      .check(people.isBiggerThan(const Constant<int>(2)).isNotNull())();
  RealColumn get commissionPercentage => real()();
  IntColumn get frequencyType => intEnum<FrequencyType>()();
  IntColumn get frequencyNumber => integer()();
  IntColumn get fManAuctionNumber => integer()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
