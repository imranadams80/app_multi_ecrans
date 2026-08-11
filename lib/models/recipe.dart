// Modèle de données pour représenter une recette
class Recipe {
  final String id;
  final String title;
  final String category;
  final int durationMinutes;
  final String imageUrl;
  final String description;
  final List<String> ingredients;

const Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.durationMinutes,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
  });
}