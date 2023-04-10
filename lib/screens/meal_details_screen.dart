import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'mealDetails';

  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(mealId)),
      body: Center(
        child: Text('The meal - $mealId'),
      ),
    );
  }
}
