import 'package:chit_app_clean/src/config/router.config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.state.g.dart';

@riverpod
class RouterState extends _$RouterState {
  @override
  String build() {
    return PAGES.auth.name;
  }
}
