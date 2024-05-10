// ignore_for_file: recursive_getters

import 'package:chit_app_clean/src/data/data_sources/local/schema/chit.schema.dart';
import 'package:drift/drift.dart';

class ChitDates extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get belongsTo =>
      integer().references(Chits, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
}
