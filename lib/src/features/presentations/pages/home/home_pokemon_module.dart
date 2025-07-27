import 'package:flutter_modular/flutter_modular.dart';

import 'home.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add(HomePokemonRepository.new);
    i.addLazySingleton(HomePokemonController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePokemonPage());
  }
}
