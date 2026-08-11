// Données fictives pour les recettes
import '../models/recipe.dart';

class MockData {
  static final List<Recipe> recipes = [
  const Recipe(
    id: '1',
    title: 'Pâtes à la carbonara',
    category: 'Pâtes',
    durationMinutes: 20,
    imageUrl: 'https://example.com/carbonara.jpg',
    description: 'Une délicieuse recette de pâtes à la carbonara.',
    ingredients: ['Pâtes', 'Lardons', 'Œufs', 'Parmesan'],
  ),
  const Recipe(
    id: '2',
    title: 'Salade César',
    category: 'Salades',
    durationMinutes: 15,
    imageUrl: 'https://example.com/cesar.jpg',
    description: 'Une salade César rafraîchissante et savoureuse.',
    ingredients: ['Pâtes', 'Lardons', 'Œufs', 'Parmesan'],
  ),
];
}
