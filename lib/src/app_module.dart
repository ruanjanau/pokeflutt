import 'package:flutter_modular/flutter_modular.dart';

import 'core/adapters/adapters.dart';
import 'core/theme/theme_app.dart';
import 'features/presentations/pages/details/details.dart';
import 'features/presentations/pages/home/home_pokemon_module.dart';
import 'features/presentations/pages/onboading/onboarding.dart';
import 'features/presentations/pages/options/options.dart';
import 'features/presentations/pages/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ThemeApp>(ThemeApp.new);
    i.addSingleton<HttpAdapter>(HttpAdapterImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/splash/', module: SplashModule());
    r.module('/home/', module: HomeModule());
    r.module('/details/', module: DetailsPokemonModule());
    r.module('/onboarding/', module: OnboardingModule());
    r.module('/options/', module: OptionModule());
  }
}
