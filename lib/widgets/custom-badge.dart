// widget reutilisable pour afficher un badge avec un texte et une couleur personnalisée
import 'package:flutter/material.dart';



class CustomBadge extends StatelessWidget {
  final String label;
  final Color? color;

  const CustomBadge({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}