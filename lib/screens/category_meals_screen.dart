import 'package:flutter/material.dart';

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
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => Text(categoryMeals[index].title),
      ),
    );
  }
}
