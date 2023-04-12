import 'package:flutter/material.dart';

import '../models/filter.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  final Filter filter;
  final void Function(Filter filter) setFilter;

  const FiltersScreen({
    super.key,
    required this.filter,
    required this.setFilter,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late Filter filter;

  @override
  void initState() {
    super.initState();
    filter = widget.filter;
  }

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
            value: filter.gluten,
            onChange: (value) => setState(
              () {
                filter = filter.copyWith(gluten: value);
                widget.setFilter(filter);
              },
            ),
          ),
          AdaptiveSwitchListTile(
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals.',
            value: filter.lactose,
            onChange: (value) => setState(
              () {
                filter = filter.copyWith(lactose: value);
                widget.setFilter(filter);
              },
            ),
          ),
          AdaptiveSwitchListTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            value: filter.vegan,
            onChange: (value) => setState(
              () {
                filter = filter.copyWith(vegan: value);
                widget.setFilter(filter);
              },
            ),
          ),
          AdaptiveSwitchListTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            value: filter.vegetarian,
            onChange: (value) => setState(
              () {
                filter = filter.copyWith(vegetarian: value);
                widget.setFilter(filter);
              },
            ),
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
