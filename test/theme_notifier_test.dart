import 'package:app_multi_ecrans/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeNotifier', () {
    test('active le thème sombre puis le thème clair', () {
      final notifier = ThemeNotifier();

      expect(notifier.theme, ThemeMode.system);

      notifier.toggleTheme(true);
      expect(notifier.theme, ThemeMode.dark);

      notifier.toggleTheme(false);
      expect(notifier.theme, ThemeMode.light);
    });
  });
}
