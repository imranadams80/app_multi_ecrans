//liste, recherche, filtrage et responsive

import 'package:app_multi_ecrans/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/recipe.dart';
import '../widgets/recipe_card.dart';
import '../widgets/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  String selectedCategory = 'All';

  List<Recipe> get filteredRecipes {
    return MockData.recipes.where((recipe) {
      final matchesSearchQuery =
          recipe.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory =
          selectedCategory == 'All' || recipe.category == selectedCategory;

      return matchesSearchQuery && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    const categories = [
      'All',
      'Italian',
      'Mexican',
      'Japanese',
      'Indian',
      'French',
      'Chinese',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recettes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushNamed('settings'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed('add'),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher une recette',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (_) {
                      setState(() => selectedCategory = category);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ResponsiveLayout(
              mobileBody: _buildRecipeGrid(1, 1.4, 10),
              tabletBody: _buildRecipeGrid(2, 1.2, 12),
              desktopBody: _buildRecipeGrid(4, 1.2, 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeGrid(int crossAxisCount, double childAspectRatio,
      double spacing) {
    return GridView.builder(
      padding: const EdgeInsets.all(12.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemCount: filteredRecipes.length,
      itemBuilder: (context, index) {
        final recipe = filteredRecipes[index];
        return RecipeCard(
          recipe: recipe,
          onTap: () => context.pushNamed('details', extra: recipe),
        );
      },
    );
  }
}
