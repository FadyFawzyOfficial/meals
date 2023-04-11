import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _screens = [
    {
      'screen': const CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'screen': const FavoritesScreen(),
      'title': 'Your Favorites',
      // 'actions': [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))]
    },
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screens[_currentIndex]['title'] as String)),
      body: _screens[_currentIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  void _onTap(int index) => setState(() => _currentIndex = index);
}
