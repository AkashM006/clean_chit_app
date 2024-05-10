// ignore_for_file: recursive_getters

import 'package:drift/drift.dart';

class UserSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get settings => text()();
}
