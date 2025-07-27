import 'package:flutter_modular/flutter_modular.dart';

import 'onboarding.dart';

class OnboardingModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const OnboardingPage());
  }
}
