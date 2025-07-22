import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_pokedex/src/core/models/models.dart';

import '../../../../core/style_scheme/style_scheme.dart';

class DetailsPokemonPage extends StatelessWidget {
  final PokemonsModel pokemon;

  const DetailsPokemonPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final Color typeColor =
        (pokemon.type.isNotEmpty)
            ? ColorsScheme().getColorByType(pokemon.type[0])
            : Colors.grey;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeight * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: typeColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -50,
                      right: 0,
                      left: 0,
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          'assets/images/pokebola.png',
                          width: screenWidth * 0.8,
                          height: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10.0,
                      left: 16.0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Modular.to.pop(),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10.0,
                      right: 16.0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40.0),
                      Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nº${pokemon.number}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        pokemon.description,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.14,
            left: screenWidth / 2.3 - 100,
            child: Image.network(
              pokemon.image,
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
