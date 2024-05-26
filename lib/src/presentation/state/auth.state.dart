import 'package:chit_app_clean/src/presentation/state/auth_status.dart';
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
    ref.read(authStatusProvider.notifier).setLastSeen();
  }

  void logout() {
    state = false;
  }
}
