import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Map<String, bool> filters;
  final void Function(Map<String, bool> filters) setFilters;

  const FiltersScreen({
    super.key,
    required this.filters,
    required this.setFilters,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool isGlutenFree;
  late bool isLactoseFree;
  late bool isVegan;
  late bool isVegetarian;

  @override
  void initState() {
    super.initState();
    var filters = widget.filters;
    isGlutenFree = filters['Gluten']!;
    isLactoseFree = filters['Lactose']!;
    isVegan = filters['Vegan']!;
    isVegetarian = filters['Vegetarian']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () => widget.setFilters({
              'Gluten': isGlutenFree,
              'Lactose': isLactoseFree,
              'Vegan': isVegan,
              'Vegetarian': isVegetarian,
            }),
            icon: const Icon(Icons.save_rounded),
          ),
        ],
      ),
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
