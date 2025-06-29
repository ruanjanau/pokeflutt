import 'package:my_pokedex/src/core/network/dio_network.dart';

abstract class IHomeRepository {
  Future<List<dynamic>> getPokemons();
}

class HomeRepository implements IHomeRepository {
  final DioNetwork _dioNetwork = DioNetwork();

  @override
  Future<List<dynamic>> getPokemons() async {
    final response = await _dioNetwork.dio.get('/pokemon?limit=20');
    return response.data;
  }
}
