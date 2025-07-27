import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes {
  static void goToSplash() {
    Modular.to.pushNamed('/splash/');
  }

  static void goToHome() {
    Modular.to.pushNamed('/home/');
  }

  static void goToDetails() {
    Modular.to.pushNamed('/details/');
  }

  static void goToOnboarding() {
    Modular.to.pushNamed('/onboarding/');
  }

  static void goToOptions() {
    Modular.to.pushNamed('/options/');
  }
}
