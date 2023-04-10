import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'categoryMeals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => MealItem(meal: categoryMeals[index]),
      ),
    );
  }
}
