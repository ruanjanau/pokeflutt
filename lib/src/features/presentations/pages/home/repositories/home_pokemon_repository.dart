import '../../../../../core/adapters/adapters.dart';
import '../../../../../core/life_cycle/life_cycle.dart';
import '../models/home_pokemon_model.dart';

class HomePokemonRepository extends RepositoryLifeCycle {
  Future<List<HomeModel>> getPokemons() async {
    try {
      final response = await httpAdapter.request(
        httpMethod: HttpMethod.get,
        url: '/pokemon?limit=20',
        needsAuthorization: false,
      );

      if (response != null && response.data != null) {
        final data = response.data;
        if (data['results'] != null) {
          final List results = data['results'];

          // 🔥 Para cada Pokémon, busca o tipo na URL de detalhes
          final pokemons = await Future.wait(
            results.map((pokemon) async {
              String type = 'unknown'; // valor padrão
              try {
                final detailResponse = await httpAdapter.request(
                  httpMethod: HttpMethod.get,
                  url: pokemon['url'].replaceFirst(
                    'https://pokeapi.co/api/v2',
                    '',
                  ),
                  needsAuthorization: false,
                );

                if (detailResponse != null && detailResponse.data != null) {
                  final typesList = detailResponse.data['types'] as List;
                  if (typesList.isNotEmpty) {
                    type = typesList[0]['type']['name']; // pega o 1º tipo
                  }
                }
              } catch (e) {
                print('⚠️ Erro ao buscar tipo para ${pokemon['name']}: $e');
              }

              return HomeModel.fromJson(pokemon, type: type);
            }).toList(),
          );

          return pokemons;
        }
      }
    } catch (e) {
      print('❌ Erro ao carregar Pokémons da API: $e');
    }

    // 🌱 Se deu erro, fallback para dados mock locais com tipo
    print('ℹ️ Usando dados mock locais');
    final mockResponse = [
      {
        "name": "bulbasaur",
        "url": "https://pokeapi.co/api/v2/pokemon/1/",
        "type": "grass",
      },
      {
        "name": "ivysaur",
        "url": "https://pokeapi.co/api/v2/pokemon/2/",
        "type": "grass",
      },
      {
        "name": "venusaur",
        "url": "https://pokeapi.co/api/v2/pokemon/3/",
        "type": "grass",
      },
      {
        "name": "charmander",
        "url": "https://pokeapi.co/api/v2/pokemon/4/",
        "type": "fire",
      },
      {
        "name": "charmeleon",
        "url": "https://pokeapi.co/api/v2/pokemon/5/",
        "type": "fire",
      },
      {
        "name": "charizard",
        "url": "https://pokeapi.co/api/v2/pokemon/6/",
        "type": "fire",
      },
      {
        "name": "squirtle",
        "url": "https://pokeapi.co/api/v2/pokemon/7/",
        "type": "water",
      },
      {
        "name": "wartortle",
        "url": "https://pokeapi.co/api/v2/pokemon/8/",
        "type": "water",
      },
      {
        "name": "blastoise",
        "url": "https://pokeapi.co/api/v2/pokemon/9/",
        "type": "water",
      },
      {
        "name": "caterpie",
        "url": "https://pokeapi.co/api/v2/pokemon/10/",
        "type": "bug",
      },
      {
        "name": "metapod",
        "url": "https://pokeapi.co/api/v2/pokemon/11/",
        "type": "bug",
      },
      {
        "name": "butterfree",
        "url": "https://pokeapi.co/api/v2/pokemon/12/",
        "type": "bug",
      },
      {
        "name": "weedle",
        "url": "https://pokeapi.co/api/v2/pokemon/13/",
        "type": "bug",
      },
      {
        "name": "kakuna",
        "url": "https://pokeapi.co/api/v2/pokemon/14/",
        "type": "bug",
      },
      {
        "name": "beedrill",
        "url": "https://pokeapi.co/api/v2/pokemon/15/",
        "type": "bug",
      },
      {
        "name": "pidgey",
        "url": "https://pokeapi.co/api/v2/pokemon/16/",
        "type": "normal",
      },
      {
        "name": "pidgeotto",
        "url": "https://pokeapi.co/api/v2/pokemon/17/",
        "type": "normal",
      },
      {
        "name": "pidgeot",
        "url": "https://pokeapi.co/api/v2/pokemon/18/",
        "type": "normal",
      },
      {
        "name": "rattata",
        "url": "https://pokeapi.co/api/v2/pokemon/19/",
        "type": "normal",
      },
      {
        "name": "raticate",
        "url": "https://pokeapi.co/api/v2/pokemon/20/",
        "type": "normal",
      },
    ];

    return mockResponse
        .map((e) => HomeModel.fromJson(e, type: e['type'] as String))
        .toList();
  }
}
