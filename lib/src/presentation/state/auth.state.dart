import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() {
    return false;
  }

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}
