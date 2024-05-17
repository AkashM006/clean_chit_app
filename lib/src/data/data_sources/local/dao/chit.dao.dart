import 'package:chit_app_clean/src/data/data_sources/local/database.dart';
import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:chit_app_clean/src/domain/models/chit.model.dart';
import 'package:drift/drift.dart';

part 'chit.dao.g.dart';

@DriftAccessor(tables: [Chits])
class ChitDao extends DatabaseAccessor<AppDatabase> with _$ChitDaoMixin {
  ChitDao(super.db);

  Stream<List<Chit>> watchChits() {
    return select(chits).watch();
  }

  Future<List<Chit>> getChits() async {
    return await select(chits).get();
  }

  Future<ChitModel> insertChit(ChitModel chit) async {
    final result = await into(chits).insertReturning(ChitsCompanion(
      amount: Value(chit.amount),
      commissionPercentage: Value(chit.commissionPercentage),
      createdAt: Value(DateTime.now()),
      endDate: Value(chit.endDate),
      fManAuctionNumber: Value(chit.fManAuctionNumber),
      frequencyNumber: Value(chit.frequencyNumber),
      frequencyType: Value(chit.frequencyType),
      name: Value(chit.name),
      people: Value(chit.people),
      startDate: Value(chit.startDate),
    ));

    return ChitModel(
      name: result.name,
      amount: result.amount,
      people: result.people,
      commissionPercentage: result.commissionPercentage,
      frequencyType: result.frequencyType,
      frequencyNumber: result.frequencyNumber,
      fManAuctionNumber: result.fManAuctionNumber,
      startDate: result.startDate,
      endDate: result.endDate,
    );
  }
}
