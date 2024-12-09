import 'package:go_router/go_router.dart';
import 'package:parcial/presentation/screens/character/character_screen.dart';
import 'package:parcial/presentation/screens/dragon_ball_screen.dart';
import 'package:parcial/presentation/screens/login_screen.dart';
import 'package:parcial/presentation/screens/planet/planet_screen.dart';
import 'package:parcial/presentation/screens/pokemons/pokemon_list_screen.dart';
import 'package:parcial/presentation/screens/transformation/transformation_screen.dart';
import 'package:parcial/presentation/screens/home_screen.dart';
import 'package:parcial/presentation/screens/pokemon_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/dragonball',
      builder: (context, state) => const DragonBallScreen(),
    ),
    GoRoute(
      path: '/pokemon',
      builder: (context, state) => const PokemonScreen(),
    ),
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonListScreen(),
    ),
    GoRoute(
      path: '/characters',
      builder: (context, state) => const CharacterScreen(),
    ),
    GoRoute(
      path: '/planets',
      builder: (context, state) => const PlanetScreen(),
    ),
    GoRoute(
      path: '/transformations',
      builder: (context, state) => const TransformationScreen(),
    ),
  ],
);
