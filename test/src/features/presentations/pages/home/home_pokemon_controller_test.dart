import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokeflutt/src/core/models/pokemon_evolution.dart';
import 'package:pokeflutt/src/core/models/pokemon_gender.dart';
import 'package:pokeflutt/src/core/models/pokemons_model.dart';
import 'package:pokeflutt/src/features/presentations/pages/home/home.dart';

class MockHomePokemonRepository extends Mock implements HomePokemonRepository {}

void main() {
  late HomePokemonController controller;
  late MockHomePokemonRepository mockRepository;

  final mockPokemons = [
    PokemonModel(
      id: 2,
      name: 'Pikachu',
      number: '025',
      type: ['Elétrico'],
      image: 'https://...',
      description:
          'Pikachu é o cara do Dragão. Ele é o mais velho dos pokémon.',
      height: '0.4 m',
      peso: '11 kg',
      habilidade: 'Causa dano em área.',
      categoria: 'Rato',
      weaknesses: ['Fogo', 'Terra'],
      strongAgainst: ['Aço', 'Dragão'],
      color: 'Branco',
      gender: PokemonGender(male: 0.5, female: 0.5),
      evolutions: [
        PokemonEvolution(
          name: 'Raichu',
          type: ['Psíquico'],
          image: 'https://...',
          stage: 1,
          number: '',
        ),
        PokemonEvolution(
          name: 'Raichu',
          type: ['Psíquico'],
          image: 'https://...',
          stage: 1,
          number: '',
        ),
      ],
    ),
    PokemonModel(
      name: 'Charmander',
      number: '004',
      type: ['Fogo'],
      image: 'https://...',
      description:
          'Charmander é o cara do Dragão. Ele é o mais velho dos pokémon.',
      height: '0.6 m',
      peso: '19 kg',
      habilidade: 'Causa dano em área.',
      categoria: 'Dragão',
      weaknesses: ['Elétrico', 'Terra'],
      strongAgainst: ['Aço', 'Dragão'],
      color: 'Branco',
      gender: PokemonGender(male: 0.5, female: 0.5),
      evolutions: [
        PokemonEvolution(
          name: 'Charmeleon',
          type: ['Fogo'],
          image: 'https://...',
          stage: 1,
          number: '',
        ),
        PokemonEvolution(
          name: 'Charmeleon',
          type: ['Fogo'],
          image: 'https://...',
          stage: 1,
          number: '',
        ),
      ],
      id: 1,
    ),
  ];

  setUp(() {
    mockRepository = MockHomePokemonRepository();
    controller = HomePokemonController(homeRepository: mockRepository);
  });

  test('Deve buscar e preencher a lista de Pokémons', () async {
    when(
      () => mockRepository.getHomePokemons(),
    ).thenAnswer((_) async => mockPokemons);

    await controller.getPokemons();

    expect(controller.pokemons, equals(mockPokemons));
    expect(controller.isLoading, isFalse);
  });

  test('Deve chamar getPokemons ao inicializar com onInit', () async {
    when(
      () => mockRepository.getHomePokemons(),
    ).thenAnswer((_) async => mockPokemons);

    controller.onInit();

    await Future.delayed(Duration.zero);

    expect(controller.pokemons, equals(mockPokemons));
  });
}
