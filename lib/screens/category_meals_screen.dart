import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/filter.dart';
import '../models/meal.dart';
import '../widgets/meals_list_view.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'categoryMeals';

  final Filter filter;

  const CategoryMealsScreen({super.key, required this.filter});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  //! Fix the Previous Commit's Issue by Fady's Solution (My Solution).
  //? use late while initializing the Variables values.
  late Filter filter = widget.filter;
  late final Category category =
      ModalRoute.of(context)!.settings.arguments as Category;
  late List<Meal> categoryMeals = dummyMeals
      .where((meal) => meal.categories.contains(category.id))
      .toList();
  late List<Meal> filteredMeals = categoryMeals.where(
    (meal) {
      if (filter.gluten && !meal.isGlutenFree) return false;

      if (filter.lactose && !meal.isLactoseFree) return false;

      if (filter.vegan && !meal.isVegan) return false;

      if (filter.vegetarian && !meal.isVegetarian) return false;

      return true;
    },
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: MealsListView(meals: filteredMeals),
    );
  }
}
