// Passage de parametres
import 'package:app_multi_ecrans/models/recipe.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight:250,
            pinned : true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.title),
              background : Hero(
                tag: recipe.id, 
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.broken_image, size: 56),
                  ),
                ),
                ),
            ),

          ),
          SliverToBoxAdapter(
            child : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(avatar: const Icon(Icons.category), label: Text(recipe.category),),
                      Chip(avatar: const Icon(Icons.timer), label: Text('${recipe.durationMinutes} minutes'),),

                    ],
                  ),
                  const SizedBox(height:16),
                  Text('Description', style:
                  Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(recipe.description, style: Theme.of(context).textTheme.bodyMedium),
                  const Divider(height: 32),
                  Text('Ingrédients', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map((ing) => ListTile(
                        leading: const Icon(Icons.check_circle, color: Colors.green),
                        title: Text(ing),
                        dense: true,
                  )),
                ],
              ),
              
              ),
          ),

        ],
      ),
    );
  }
}
