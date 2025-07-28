//coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeflutt/src/core/widgets/widgets.dart';
import '../../../../core/models/models.dart';

import '../home/widgets/widgets.dart';

import '../../../../core/assets/assets.dart';
import '../../../../core/style_scheme/style_scheme.dart';
import 'details.dart';

class DetailsPokemonPage extends StatelessWidget {
  final PokemonModel pokemon;

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
                          ImagesNetwork.pokebola,
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
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
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

                        SizedBox(height: 16.0),
                        TypePokemonComponent(types: pokemon.type),
                        SizedBox(height: 16.0),
                        Text(
                          pokemon.description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 16.0),
                        Divider(),
                        SizedBox(height: 16.0),
                        InfoDetailComponent(
                          detailOne: Strings.weight,
                          iconOne: Icons.fitness_center,
                          infoOne: pokemon.peso,
                          detailTwo: Strings.height,
                          iconTwo: Icons.height_outlined,
                          infoTwo: pokemon.height,
                        ),
                        SizedBox(height: 16.0),
                        InfoDetailComponent(
                          detailOne: Strings.ability,
                          iconOne: Icons.flash_on,
                          infoOne: pokemon.habilidade,
                          detailTwo: Strings.catogory,
                          iconTwo: Icons.label,
                          infoTwo: pokemon.categoria,
                        ),
                        SizedBox(height: 16.0),
                        Center(
                          child: Text(
                            Strings.gender,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GenderProgressBar(
                          malePercentage: pokemon.gender.male,
                          femalePercentage: pokemon.gender.female,
                        ),
                        const SizedBox(height: 16.0),
                        Center(
                          child: Text(
                            'Fraquezas',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 4,
                                mainAxisSpacing: 8,
                              ),
                          itemCount: pokemon.weaknesses.length,
                          itemBuilder: (context, index) {
                            final weakness = pokemon.weaknesses[index];
                            return TypesPokemon(
                              type: weakness,
                              color: ColorsScheme().getColorByType(weakness),
                              icon: IconsScheme().getIconByType(weakness),
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Center(
                          child: Text(
                            Strings.evolutions,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Column(
                          children:
                              pokemon.evolutions.map((evolution) {
                                return PokemonEvolutionComponent(
                                  name: evolution.name,
                                  number: evolution.number,
                                  types: evolution.type,
                                  imageUrl: evolution.image,
                                );
                              }).toList(),
                        ),
                      ],
                    ),
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
