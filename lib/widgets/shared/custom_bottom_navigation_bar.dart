import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            activeIcon: Icon(Icons.home_max_rounded),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.label_outlined),
            activeIcon: Icon(Icons.label_rounded),
            label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite_border_rounded),
            label: 'Favorites'),
      ],
    );
  }
}
