import '../../../../../core/adapters/adapters.dart';
import '../../../../../core/life_cycle/life_cycle.dart';
import '../../../../../core/models/models.dart';

class HomePokemonRepository extends RepositoryLifeCycle {
  Future<List<PokemonsModel>> getHomePokemons() async {
    final response = await httpAdapter.request(
      httpMethod: HttpMethod.get,
      url: 'pokemons',
      needsAuthorization: true,
    );
    if (response == null) return [];

    final dataList = response.data as List;
    if (dataList.isEmpty) return [];
    final pokemons = List<PokemonsModel>.from(
      response.data[0]['pokemons'].map((e) => PokemonsModel.fromJson(e)),
    );
    return pokemons;
  }
}
