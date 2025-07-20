import 'package:mobx/mobx.dart';
import 'package:my_pokedex/src/core/life_cycle/controller_life_cycle.dart';
import '../../../../../core/models/models.dart';
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
    getPokemons();
    super.onInit(params);
  }

  @observable
  List<PokemonsModel> pokemons = [];

  @observable
  PokemonsModel? pokemon;

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  Future<void> getPokemons() async {
    setIsLoading(true);
    final pokemons = await _homeRepository.getHomePokemons();
    setPokemons(pokemons);
    setIsLoading(false);
  }

  @action
  void setPokemons(List<PokemonsModel> pokemons) => this.pokemons = pokemons;

  @action
  void setPokemon(PokemonsModel pokemon) => this.pokemon = pokemon;
}
