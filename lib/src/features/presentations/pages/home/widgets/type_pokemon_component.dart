import 'package:flutter/material.dart';

import '../../../../../core/style_scheme/style_scheme.dart';

class TypePokemonComponent extends StatelessWidget {
  final List<String> types;

  const TypePokemonComponent({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          types.map((type) {
            final color = ColorsScheme().getColorByType(type);
            final icon = IconsScheme().getIconByType(type);
            return Container(
              margin: const EdgeInsets.only(right: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Icon(icon, size: 18.0, color: Colors.white),
                  const SizedBox(width: 4.0),
                  Text(
                    type,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
