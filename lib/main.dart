// Point d'entrée
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'theme/theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const SavouraApp(),
    ),
  );
}

class SavouraApp extends StatelessWidget {
  const SavouraApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp.router(
      title: 'Savoura Recipes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeNotifier.theme,
      routerConfig: appRouter,
    );
  }
}

