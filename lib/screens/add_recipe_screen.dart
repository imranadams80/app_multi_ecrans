// Formulaire avec validation pour ajouter une nouvelle recette, comprenant des champs pour le titre, la description, le temps de préparation et le niveau de difficulté

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _duration = '';
  String _category = 'Italien';
  String _description = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Recette "$_title" ajoutée avec succès !')),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une recette')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Titre de la recette'),
                validator: (value) => (value == null || value.trim().isEmpty) ? 'Le titre est obligatoire' : null,
                onSaved: (val) => _title = val!,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Temps de préparation (min)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Indiquez le temps';
                  if (int.tryParse(value) == null) return 'Entrez un nombre valide';
                  return null;
                },
                onSaved: (val) => _duration = val!,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(labelText: 'Catégorie'),
                items: ['Italien', 'Mexicain', 'Japonais', 'Français']
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (val) => setState(() => _category = val!),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) => (value == null || value.length < 10) ? 'Description d\'au moins 10 caractères' : null,
                onSaved: (val) => _description = val!,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.save),
                label: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
