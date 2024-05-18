// ignore_for_file: recursive_getters

import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:drift/drift.dart';

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

ChitModel chitToModel(Chit chit) {
  return ChitModel(
    id: chit.id,
    name: chit.name,
    amount: chit.amount,
    people: chit.people,
    commissionPercentage: chit.commissionPercentage,
    frequencyType: chit.frequencyType,
    frequencyNumber: chit.frequencyNumber,
    fManAuctionNumber: chit.fManAuctionNumber,
    startDate: chit.startDate,
    endDate: chit.endDate,
  );
}

Chit modelToChit(ChitModel model) {
  return Chit(
    id: model.id,
    name: model.name,
    amount: model.amount,
    people: model.people,
    commissionPercentage: model.commissionPercentage,
    frequencyType: model.frequencyType,
    frequencyNumber: model.frequencyNumber,
    fManAuctionNumber: model.fManAuctionNumber,
    startDate: model.startDate, 
    endDate: model.endDate,
    createdAt: model.createdAt ?? DateTime.now(),
  );
}

ChitsCompanion modelToChitsCompanion(ChitModel model) {
  return ChitsCompanion(
    amount: Value(model.amount),
    commissionPercentage: Value(model.commissionPercentage),
    createdAt: Value(model.createdAt ?? DateTime.now()),
    endDate: Value(model.endDate),
    fManAuctionNumber: Value(model.fManAuctionNumber),
    frequencyNumber: Value(model.frequencyNumber),
    frequencyType: Value(model.frequencyType),
    name: Value(model.name),
    people: Value(model.people),
    startDate: Value(model.startDate),
  );
}
