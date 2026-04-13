import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'resumen_screen.dart';
import 'resultados_screen.dart';
import 'actas_screen.dart';
import 'participacion_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List<Widget> _screens =  [
    ResumenScreen(),
    ResultadosScreen(),
    ActasScreen(),
    ParticipacionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],

      bottomNavigationBar: BottomNav(
        currentIndex: _index,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
      ),
    );
  }
}
