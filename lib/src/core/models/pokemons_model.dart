class PokemonsModel {
  final int id;
  final String name;
  final String number;
  final List<String> type;
  final String image;
  final String height;
  final String weight;
  final List<String> weaknesses;
  final List<String> strongAgainst;
  final String description;
  final String color;

  PokemonsModel({
    required this.id,
    required this.name,
    required this.number,
    required this.type,
    required this.image,
    required this.height,
    required this.weight,
    required this.weaknesses,
    required this.strongAgainst,
    required this.description,
    required this.color,
  });

  factory PokemonsModel.fromJson(Map<String, dynamic> json) {
    return PokemonsModel(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      type: List<String>.from(json['type']),
      image: json['image'],
      height: json['height'],
      weight: json['weight'],
      weaknesses: List<String>.from(json['weaknesses']),
      strongAgainst: List<String>.from(json['strongAgainst']),
      description: json['description'],
      color: json['color'],
    );
  }
}
