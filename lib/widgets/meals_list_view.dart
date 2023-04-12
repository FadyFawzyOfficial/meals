import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'meal_item.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index]),
    );
  }
}
