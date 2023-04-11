import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(16),
            alignment: AlignmentDirectional.bottomStart,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          buildListTile(
            label: 'Meals',
            icon: Icons.restaurant,
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
          buildListTile(
            label: 'Filters',
            icon: Icons.settings,
            onPressed: () => Navigator.pushNamed(
              context,
              FiltersScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onPressed,
    );
  }
}
