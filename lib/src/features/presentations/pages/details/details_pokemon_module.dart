import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/models/models.dart';

import 'details.dart';

class DetailsPokemonModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) {
        final pokemon = Modular.args.data as PokemonModel;
        return DetailsPokemonPage(pokemon: pokemon);
      },
    );
  }
}
