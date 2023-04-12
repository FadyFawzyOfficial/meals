import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          AdaptiveSwitchListTile(
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals.',
            value: isGlutenFree,
            onChange: (value) => setState(() => isGlutenFree = value),
          ),
          AdaptiveSwitchListTile(
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals.',
            value: isLactoseFree,
            onChange: (value) => setState(() => isLactoseFree = value),
          ),
          AdaptiveSwitchListTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            value: isVegan,
            onChange: (value) => setState(() => isVegan = value),
          ),
          AdaptiveSwitchListTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            value: isVegetarian,
            onChange: (value) => setState(() => isVegetarian = value),
          ),
        ],
      ),
    );
  }
}

class AdaptiveSwitchListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool value) onChange;

  const AdaptiveSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChange,
    );
  }
}
