import 'package:chit_app_clean/src/domain/models/chit.model.dart';

abstract interface class ChitRepository {
  Stream<List<ChitModel>> watchChits();
}
