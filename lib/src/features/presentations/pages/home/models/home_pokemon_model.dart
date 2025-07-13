const _pokedexImg =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

class HomeModel {
  final String id;
  final String name;
  final String image;
  final String type;

  HomeModel({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  factory HomeModel.fromJson(
    Map<String, dynamic> json, {
    required String type,
  }) {
    List<String> id = json['url'].split('/');
    return HomeModel(
      id: id[id.length - 2],
      name: json['name'],
      image: '${_pokedexImg + id[id.length - 2]}.png',
      type: type,
    );
  }
}
