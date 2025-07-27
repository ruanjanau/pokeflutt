import 'package:flutter/material.dart';

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
              // Nome e número
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
                    // Barra de tipo
                    Row(
                      children:
                          types.map((type) {
                            final color = ColorsScheme().getColorByType(type);
                            final icon = IconsScheme().getIconByType(type);
                            return Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: 24,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(icon, size: 12, color: Colors.white),
                                  const SizedBox(width: 4),
                                  Text(
                                    type,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
