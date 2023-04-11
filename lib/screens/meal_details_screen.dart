import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'mealDetails';

  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(mealId)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              height: 300,
              fit: BoxFit.cover,
            ),
            buildTitleSection(context, 'Ingredients'),
            buildListContainer(
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
              ),
            ),
            buildTitleSection(context, 'Steps'),
            buildListContainer(
              child: ListView.separated(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(
                    selectedMeal.steps[index],
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context, mealId),
        child: const Icon(Icons.delete_rounded),
      ),
    );
  }

  Container buildListContainer({required Widget child}) {
    return Container(
      height: 150,
      width: 300,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: child,
    );
  }

  Padding buildTitleSection(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
