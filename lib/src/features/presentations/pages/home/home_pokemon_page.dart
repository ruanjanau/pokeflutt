import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_pokedex/src/core/life_cycle/page_life_cycle.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/controllers/home_pokemon_controller.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/widgets/card_pokemon.dart';

class HomePokemonPage extends StatefulWidget {
  const HomePokemonPage({super.key});

  @override
  State<HomePokemonPage> createState() => _HomePokemonPageState();
}

class _HomePokemonPageState
    extends PageLifeCycleState<HomePokemonController, HomePokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Observer(
          builder: (_) {
            if (controller.isLoading) {
              return const CircularProgressIndicator();
            }
            if (controller.pokemons.isEmpty) {
              return const Center(child: Text('Nenhum Pokemon encontrado'));
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = controller.pokemons[index];
                return CardPokemon(
                  id: pokemon.id,
                  name: pokemon.name,
                  type: pokemon.type,
                  image: pokemon.image,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
