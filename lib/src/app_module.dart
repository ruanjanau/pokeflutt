import 'package:flutter_modular/flutter_modular.dart';

import 'features/presentations/pages/home/home_module.dart';
import 'features/presentations/pages/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.module('/splash/', module: SplashModule());
    r.module('/home/', module: HomeModule());
  }
}
