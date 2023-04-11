import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          MealDetailsScreen.routeName,
          arguments: meal.id,
        ),
        splashColor: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                PositionedDirectional(
                  bottom: 24,
                  end: 16,
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(16),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined),
                      const SizedBox(width: 4),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_outline),
                      const SizedBox(width: 4),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_outlined),
                      const SizedBox(width: 4),
                      Text(meal.affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
