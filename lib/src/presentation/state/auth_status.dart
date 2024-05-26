import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_status.g.dart';

@Riverpod(keepAlive: true)
class AuthStatus extends _$AuthStatus {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setLastSeen() {
    state = DateTime.now();
  }
}
