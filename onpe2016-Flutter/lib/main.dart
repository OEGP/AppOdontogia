import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const HomeScreen(),
    );
  }
}
