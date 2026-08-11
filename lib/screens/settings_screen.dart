// Gestion du theme clair / sombre (settings_screen.dart) pour permettre à l'utilisateur de basculer entre le mode clair et le mode sombre de l'application
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_notifier.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDark = themeNotifier.theme == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Mode Sombre'),
            subtitle: const Text('Basculer entre le thème clair et sombre'),
            secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            value: isDark,
            onChanged: (val) => themeNotifier.toggleTheme(val),
          ),
        ],
      ),
    );
  }
}
