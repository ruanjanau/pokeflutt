import '../../../../../core/adapters/adapters.dart';
import '../../../../../core/life_cycle/life_cycle.dart';
import '../models/home_pokemon_model.dart';

class HomePokemonRepository extends RepositoryLifeCycle {
  Future<List<HomeModel>> getHomePokemons() async {
    final response = await httpAdapter.request(
      httpMethod: HttpMethod.get,
      url: 'pokemons',
      needsAuthorization: true,
    );
    if (response == null) return [];

    final dataList = response.data as List;
    if (dataList.isEmpty) return [];
    final pokemons = List<HomeModel>.from(
      response.data[0]['pokemons'].map((e) => HomeModel.fromJson(e)),
    );
    return pokemons;
  }
}
