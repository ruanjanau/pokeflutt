import 'package:mobx/mobx.dart';
import 'package:my_pokedex/src/core/life_cycle/controller_life_cycle.dart';
import '../models/home_pokemon_model.dart';
import '../repositories/home_pokemon_repository.dart';

part 'home_pokemon_controller.g.dart';

class HomePokemonController = HomePokemonControllerBase
    with _$HomePokemonController;

abstract class HomePokemonControllerBase with Store, ControllerLifeCycle {
  final HomePokemonRepository _homeRepository;

  HomePokemonControllerBase({required HomePokemonRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  void onInit([Map<String, dynamic>? params]) {
    print('✅ onInit chamado');
    getPokemons();
    super.onInit(params);
  }

  @observable
  List<HomeModel> pokemons = [];

  @observable
  HomeModel? pokemon;

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  Future<void> getPokemons() async {
    print('🚀 Buscando pokémons...');
    setIsLoading(true);
    await _homeRepository
        .getPokemons()
        .then((response) {
          print('🎯 Pokémons carregados: ${response.length}');
          pokemons.clear();
          pokemons.addAll(response);
        })
        .whenComplete(() {
          print('🏁 Finalizado');
          setIsLoading(false);
        });
  }
}
