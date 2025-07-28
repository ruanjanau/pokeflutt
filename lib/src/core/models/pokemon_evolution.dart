//coverage:ignore-file

class PokemonEvolution {
  final int stage;
  final String name;
  final String number;
  final List<String> type;
  final String image;

  PokemonEvolution({
    required this.stage,
    required this.name,
    required this.number,
    required this.type,
    required this.image,
  });

  factory PokemonEvolution.fromJson(Map<String, dynamic> json) {
    return PokemonEvolution(
      stage: json['stage'],
      name: json['name'],
      number: json['number'],
      type: List<String>.from(json['type']),
      image: json['image'],
    );
  }
}
