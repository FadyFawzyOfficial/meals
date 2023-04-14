import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_list_view.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isNotEmpty
        ? MealsListView(meals: favoriteMeals)
        : const Center(
            child: Text('You have no favorites yet - start adding some!'),
          );
  }
}
