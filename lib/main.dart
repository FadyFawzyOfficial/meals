import 'package:flutter/material.dart';

import 'models/filter.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var _filter = const Filter();
  List<Meal> _favoriteMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 52, 52, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 52, 52, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                // fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (_) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(filter: _filter),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(
              favoriteMeals: _favoriteMeals,
              setFavoriteMeals: _setFavoriteMeals,
            ),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(filter: _filter, setFilter: _setFilter),
      },
    );
  }

  void _setFilter(Filter filter) => _filter = filter;

  void _setFavoriteMeals(List<Meal> favoriteMeals) =>
      _favoriteMeals = favoriteMeals;
}
