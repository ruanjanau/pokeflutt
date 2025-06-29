import '../../../../../core/network/dio_network.dart';
import '../models/pokemon_detail_model.dart';

abstract class IDetailPokemonRepository {
  Future<PokemonDetailModel> getPokemons(String id);
}

class DetailPokemonRepository implements IDetailPokemonRepository {
  @override
  Future<PokemonDetailModel> getPokemons(String id) async {
    final DioNetwork dioNetwork = DioNetwork();

    final response = await dioNetwork.dio.get('/pokemon/$id/');
    return PokemonDetailModel.fromJson(response.data);
  }
}
