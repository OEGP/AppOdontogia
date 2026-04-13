import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      selectedItemColor: const Color(0xFF755A20),
      unselectedItemColor: Colors.grey,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Resumen",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: "Resultados",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: "Actas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart),
          label: "Participación",
        ),
      ],
    );
  }
}
