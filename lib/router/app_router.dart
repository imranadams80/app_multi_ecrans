import 'package:app_multi_ecrans/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/add_recipe_screen.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return DetailScreen(recipe: recipe);
      },
    ),
    GoRoute(
      path: '/add',
      name: 'add',
      builder: (context, state) => const AddRecipeScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
