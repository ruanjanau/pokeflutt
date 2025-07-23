class PokemonsModel {
  final int id;
  final String name;
  final String number;
  final List<String> type;
  final String image;
  final String height;
  final String peso;
  final String habilidade;
  final String categoria;
  final List<String> weaknesses;
  final List<String> strongAgainst;
  final String description;
  final String color;
  final PokemonGender gender;

  PokemonsModel({
    required this.id,
    required this.name,
    required this.number,
    required this.type,
    required this.image,
    required this.height,
    required this.peso,
    required this.habilidade,
    required this.categoria,
    required this.weaknesses,
    required this.strongAgainst,
    required this.description,
    required this.color,
    required this.gender,
  });

  factory PokemonsModel.fromJson(Map<String, dynamic> json) {
    return PokemonsModel(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      type: List<String>.from(json['type']),
      image: json['image'],
      height: json['height'],
      peso: json['peso'],
      habilidade: json['habilidade'],
      categoria: json['categoria'],
      weaknesses: List<String>.from(json['weaknesses']),
      strongAgainst: List<String>.from(json['strongAgainst']),
      description: json['description'],
      color: json['color'],
      gender: PokemonGender.fromJson(json['gender']),
    );
  }
}

class PokemonGender {
  final double male;
  final double female;

  PokemonGender({required this.male, required this.female});

  factory PokemonGender.fromJson(Map<String, dynamic> json) {
    return PokemonGender(
      male: (json['male'] as num).toDouble(),
      female: (json['female'] as num).toDouble(),
    );
  }
}
