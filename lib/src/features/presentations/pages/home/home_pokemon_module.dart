import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/controllers/home_pokemon_controller.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/home_pokemon_page.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/repositories/repositories.dart';

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
