import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('You have no favorites yet - start adding some!'),
          )
        : const Center(
            child: Text('You have favorites - Build the Design !!!'),
          );
  }
}
