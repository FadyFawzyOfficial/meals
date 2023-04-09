import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String title;

  const CategoryMealsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('The Recipes For The Category'),
      ),
    );
  }
}
