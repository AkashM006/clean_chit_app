import 'package:app_settings/app_settings.dart';
import 'package:chit_app_clean/src/config/settings.config.dart';
import 'package:local_auth/local_auth.dart';

final auth = LocalAuthentication();

Future<bool> isDeviceSecured() {
  return auth.isDeviceSupported();
}

Future<void> redirectToDeviceLockSetup() {
  return AppSettings.openAppSettings(
    type: AppSettingsType.security,
  );
}

Future<bool> showLock() async {
  try {
    final authenticated = await auth.authenticate(
        localizedReason: 'Login to use $appName',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ));
    return authenticated;
  } catch (e) {
    print("Error: $e");
    return false;
  }
}
