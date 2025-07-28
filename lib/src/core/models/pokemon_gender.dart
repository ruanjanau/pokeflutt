//coverage:ignore-file

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
