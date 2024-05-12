enum PAGES {
  auth,
  home,
  pinsetup,
}

extension AppRoutesExtension on PAGES {
  String get path {
    switch (this) {
      case PAGES.auth:
        return '/';
      case PAGES.home:
        return '/home';
      case PAGES.pinsetup:
        return '/pin-setup';
    }
  }

  String get name {
    switch (this) {
      case PAGES.auth:
        return 'AUTH';
      case PAGES.home:
        return 'HOME';
      case PAGES.pinsetup:
        return "PIN SETUP";
    }
  }
}
