// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePokemonController on HomePokemonControllerBase, Store {
  late final _$pokemonsAtom = Atom(
    name: 'HomePokemonControllerBase.pokemons',
    context: context,
  );

  @override
  List<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$pokemonAtom = Atom(
    name: 'HomePokemonControllerBase.pokemon',
    context: context,
  );

  @override
  PokemonModel? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonModel? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: 'HomePokemonControllerBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getPokemonsAsyncAction = AsyncAction(
    'HomePokemonControllerBase.getPokemons',
    context: context,
  );

  @override
  Future<void> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  late final _$HomePokemonControllerBaseActionController = ActionController(
    name: 'HomePokemonControllerBase',
    context: context,
  );

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$HomePokemonControllerBaseActionController
        .startAction(name: 'HomePokemonControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$HomePokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPokemons(List<PokemonModel> pokemons) {
    final _$actionInfo = _$HomePokemonControllerBaseActionController
        .startAction(name: 'HomePokemonControllerBase.setPokemons');
    try {
      return super.setPokemons(pokemons);
    } finally {
      _$HomePokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
pokemon: ${pokemon},
isLoading: ${isLoading}
    ''';
  }
}
