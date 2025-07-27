import 'package:flutter/material.dart';
import 'package:pokeflutt/src/core/widgets/widgets.dart';

import '../../../../../core/style_scheme/style_scheme.dart';

class PokemonEvolutionComponent extends StatelessWidget {
  final String name;
  final String number;
  final List<String> types;
  final String imageUrl;

  const PokemonEvolutionComponent({
    super.key,
    required this.name,
    required this.number,
    required this.types,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final primaryType = types.first;
    final typeColor = ColorsScheme().getColorByType(primaryType);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: typeColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.network(
                  imageUrl,
                  width: 36,
                  height: 36,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Nº${number.replaceAll("#", "")}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children:
                          types.map((type) {
                            final color = ColorsScheme().getColorByType(type);
                            final icon = IconsScheme().getIconByType(type);
                            return TypesPokemon(
                              type: type,
                              color: color,
                              icon: icon,
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
