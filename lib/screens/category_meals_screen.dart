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
  late final Category category;
  late List<Meal> categoryMeals;
  var _loadedInitialList = false;

  //! We can access the "context" here instead of initState(). But,
  //? didChangeDependencies() runs a couple of times after the initialization
  //? of State, that's the difference to initState() of course.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitialList) {
      category = ModalRoute.of(context)!.settings.arguments as Category;
      categoryMeals = dummyMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      _loadedInitialList = true;
    }
  }

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
