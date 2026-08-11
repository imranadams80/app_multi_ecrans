// Widget / recipe_card.dart /reutilisable pour afficher une carte de recette avec une image, un titre, un temps de préparation et un niveau de difficulté
import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'custom-badge.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const RecipeCard({super.key, 
  required this.recipe, 
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children : [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: recipe.id,
                      child: Image.network(
                        recipe.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const
                            Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Titre de la recette
                        Text(
                          recipe.title,
                          style: 
                          Theme.of(context).textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Temps de préparation et niveau de difficulté
                        Row(
                          children: [
                            const Icon(Icons.timer, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              '${recipe.durationMinutes} min',
                               style: const TextStyle(fontSize: 12, color: Colors.grey)
                               ),
                          ],
                        ),
                ],
              ),
          ),
  ],
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CustomBadge(label: recipe.category, color: null,),
                        // Temps de préparation
                        
                        ),
                      ],
                    ),
                  ),
                  );
  }
}
              
          
          
