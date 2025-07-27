import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_pokedex/src/core/assets/strings/strings.dart';
import 'package:my_pokedex/src/core/life_cycle/page_life_cycle.dart';
import 'package:my_pokedex/src/core/theme/theme_app.dart';
import 'package:my_pokedex/src/core/widgets/filter_button.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/controllers/home_pokemon_controller.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/widgets/card_pokemon_component.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/widgets/card_pokemon_shimmer_component.dart';

class HomePokemonPage extends StatefulWidget {
  const HomePokemonPage({super.key});

  @override
  State<HomePokemonPage> createState() => _HomePokemonPageState();
}

class _HomePokemonPageState
    extends PageLifeCycleState<HomePokemonController, HomePokemonPage> {
  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeApp>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            Strings.pokemons,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeStore.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              setState(() => themeStore.toggleTheme());
            },
          ),
        ],
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
                FilterButton(),
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
