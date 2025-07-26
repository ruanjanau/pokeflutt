import 'models.dart';

class PokemonModel {
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
  final List<PokemonEvolution> evolutions;

  PokemonModel({
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
    required this.evolutions,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
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
      evolutions: List<PokemonEvolution>.from(
        json['evolutions'].map((x) => PokemonEvolution.fromJson(x)),
      ),
    );
  }
}
