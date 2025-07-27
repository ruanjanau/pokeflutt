import 'package:pokeflutt/src/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/assets/assets.dart';
import '../../../../core/life_cycle/page_life_cycle.dart';
import 'home.dart';
import 'widgets/card_pokemon_shimmer_component.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            Strings.pokemons,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),

        backgroundColor: Colors.redAccent,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Observer(
          builder: (_) {
            if (controller.isLoading) {
              return CardPokemonShimmerComponent();
            }
            if (controller.pokemons.isEmpty) {
              return const Center(child: Text('Nenhum Pokemon encontrado'));
            }
            return Column(
              children: [
                PrimaryButton(
                  titileButton: 'Opções',
                  onPressed: () => Modular.to.pushNamed('/options'),
                  color: Colors.redAccent,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.pokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = controller.pokemons[index];
                      return CardPokemonComponent(
                        onTap:
                            () => Modular.to.pushNamed(
                              '/details',
                              arguments: pokemon,
                            ),

                        number: pokemon.number,
                        name: pokemon.name,
                        types: pokemon.type,
                        image: pokemon.image,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
