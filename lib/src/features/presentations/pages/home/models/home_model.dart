const _pokedexImg =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

class HomeModel {
  final String id;
  final String name;
  final String image;

  HomeModel({required this.id, required this.name, required this.image});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    List<String> id = json['url'].split('/');
    return HomeModel(
      id: id[id.length - 2],
      name: json['name'],
      image: '${_pokedexImg + id[id.length - 2]}.png',
    );
  }
}
