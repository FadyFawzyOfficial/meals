import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('category.title')),
      body: const Center(
        child: Text('The Recipes For The Category'),
      ),
    );
  }
}
