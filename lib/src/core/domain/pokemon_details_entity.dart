//coverage:ignore-file

class PokemonDetailEntity {
  final List<String> types;
  final String name;
  final String image;
  final double height;
  final double weight;

  PokemonDetailEntity({
    required this.types,
    required this.name,
    required this.image,
    required this.height,
    required this.weight,
  });
}
