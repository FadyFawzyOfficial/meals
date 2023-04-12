import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'categoryMeals';

  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  //! Fix the Previous Commit's Issue by Fady's Solution (My Solution).
  //? use late while initializing the Variables values.
  late final Category category =
      ModalRoute.of(context)!.settings.arguments as Category;
  late List<Meal> categoryMeals = dummyMeals
      .where((meal) => meal.categories.contains(category.id))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => MealItem(
          meal: categoryMeals[index],
          removeItem: _removeMeal,
        ),
      ),
    );
  }

  void _removeMeal({required String id}) =>
      setState(() => categoryMeals.removeWhere((meal) => meal.id == id));
}
