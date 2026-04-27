import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'screens/resumen_screen.dart';
import 'screens/resultados_screen.dart';
import 'screens/actas_screen.dart';
import 'screens/participacion_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  final screens = [
    ResumenScreen(),
    ResultadosScreen(),
    ActasScreen(),
    ParticipacionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ONPE 2016',
      theme: ThemeData(
        primaryColor: const Color(0xFF051533),
        scaffoldBackgroundColor: const Color(0xFFF9F9FF),
        fontFamily: 'Inter',
      ),
      home: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          selectedItemColor: const Color(0xFF755A20),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Resumen"),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Resultados"),
            BottomNavigationBarItem(icon: Icon(Icons.find_in_page), label: "Actas"),
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Participación"),
          ],
        ),
      ),
    );
  }
}
