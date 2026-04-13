import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/card_widget.dart';
import '../widgets/progress_bar.dart';

class ResultadosScreen extends StatelessWidget {
  const ResultadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),

      body: Column(
        children: [
          const Header(title: "Segunda Elección Presidencial 2016"),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: const [
                  Text(
                    "Participación Ciudadana",
                    style: TextStyle(
                      color: Color(0xFF755A20),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Estado de Participación",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Barra de progreso
                  ProgressBar(value: 0.80012),

                  SizedBox(height: 20),

                  // Cards
                  InfoCard(
                    title: "Electores Hábiles",
                    value: "22,017,030",
                    icon: Icons.how_to_reg,
                    color: Color(0xFF051533),
                  ),

                  InfoCard(
                    title: "Ciudadanos que Votaron",
                    value: "17,615,846",
                    icon: Icons.how_to_vote,
                    color: Color(0xFF755A20),
                  ),

                  InfoCard(
                    title: "Ausentismo",
                    value: "19.988%",
                    icon: Icons.person_off,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
