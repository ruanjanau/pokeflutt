import 'package:flutter/material.dart';
import 'package:my_pokedex/src/features/presentations/pages/home/widgets/card_pokemon_skeleton_component.dart';
import 'package:shimmer/shimmer.dart';

class CardPokemonShimmerComponent extends StatelessWidget {
  const CardPokemonShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CardPokemonSkeleton();
        },
      ),
    );
  }
}
