import 'package:flutter/material.dart';

import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };

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
        '/': (_) => const TabsScreen(),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(filters: filters),
        MealDetailsScreen.routeName: (_) => const MealDetailsScreen(),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(filters: filters, setFilters: setFilters),
      },
    );
  }

  void setFilters(Map<String, bool> filters) =>
      setState(() => this.filters = filters);
}
