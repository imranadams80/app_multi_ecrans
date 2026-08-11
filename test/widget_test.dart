import 'package:app_multi_ecrans/main.dart';
import 'package:app_multi_ecrans/theme/theme_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('affiche l’écran d’accueil des recettes', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: const SavouraApp(),
      ),
    );
    await tester.pump();

    expect(find.text('Recettes'), findsOneWidget);
    expect(find.text('Rechercher une recette'), findsOneWidget);
  });
}
