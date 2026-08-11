# Savoura Recipes — Projet Flutter multi-écrans

Une application Flutter responsive de catalogue de recettes culinaires avec filtrage, gestion du thème clair/sombre et navigation avec GoRouter.

## Fonctionnalités

- **4 écrans distincts** : accueil (liste), détail, formulaire d'ajout et paramètres.
- **Navigation GoRouter** avec routes nommées et passage d'objets avec `extra`.
- **Recherche et filtrage** en temps réel par mot-clé et catégorie.
- **Formulaire validé** : titre, durée et description sont contrôlés avant validation.
- **Thème dynamique** : basculement entre mode clair et mode sombre via Provider.
- **Responsive design** : adaptation mobile, tablette et desktop via `LayoutBuilder`.

## Widgets clés utilisés (8+)

1. `ListView` et `GridView`
2. `Stack` et `Positioned`
3. `Card` et `InkWell`
4. `Hero`
5. `TextFormField` et `DropdownButtonFormField`
6. `CustomScrollView` et `SliverAppBar`
7. `SwitchListTile`
8. `FilterChip`

## Widgets réutilisables (`lib/widgets/`)

- `RecipeCard` : carte affichant l'aperçu d'une recette.
- `CustomBadge` : badge stylisé pour les catégories.
- `ResponsiveLayout` : widget adaptatif selon la largeur de l'écran.

## Lancement du projet

```bash
# 1. Cloner le dépôt
git clone https://github.com/imranadams80/app_multi_ecrans.git

# 2. Ouvrir le dossier du projet
cd app_multi_ecrans

# 3. Installer les dépendances
flutter pub get

# 4. Lancer l'application
flutter run
```

## Vérification de la grille d'évaluation

- **4 écrans distincts** : `HomeScreen`, `DetailScreen`, `AddRecipeScreen`, `SettingsScreen`.
- **Navigation** : GoRouter avec routes nommées et transmission de paramètres.
- **Recherche/filtrage** : barre de recherche et puces de catégories avec `FilterChip`.
- **Formulaire** : quatre champs, avec validation du titre, de la durée et de la description via `FormState.validate()`.
- **Thème** : gestion réactive via Provider, `ThemeNotifier` et `AppTheme`.
- **8+ widgets** : `ListView`, `GridView`, `Stack`, `Card`, `Hero`, `SliverAppBar`, `FilterChip`, `SwitchListTile`.
- **3 widgets réutilisables** dans `lib/widgets/`.
- **Séparation UI/données** : modèle `Recipe` et données `MockData` séparés des écrans.
- **Responsive** : adaptation selon les contraintes d'écran avec `LayoutBuilder`.

## Captures d'écran

### Accueil

![Écran d'accueil](screenshots/ecran%20d%27accueil.jpeg)

### Détail

![Écran de détail](screenshots/ecran%20de%20detail.jpeg)

### Formulaire d'ajout

![Formulaire d'ajout](screenshots/Formulaire%20d%27ajout.jpeg)

### Paramètres

![Écran des paramètres](screenshots/ecran%20des%20parametres.jpeg)
