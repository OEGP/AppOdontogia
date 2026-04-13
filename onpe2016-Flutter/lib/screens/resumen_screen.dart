import 'package:flutter/material.dart';

class ResumenScreen extends StatelessWidget {
  const ResumenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Elección Presidencial 2016",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFF9F9FF),
        foregroundColor: const Color(0xFF051533),
        elevation: 0,
        leading: const Icon(Icons.menu),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // HERO
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1C2A49),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Actas Procesadas",
                      style: TextStyle(color: Colors.white70, fontSize: 10)),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("100.0",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("%",
                          style: TextStyle(color: Colors.amber, fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _candidato("Pedro Pablo Kuczynski",
                "Peruanos por el Kambio", 50.12, true),

            _candidato("Keiko Fujimori",
                "Fuerza Popular", 49.88, false),

            const SizedBox(height: 20),

            _card("Participación", "81.80%"),
            _card("Electores Hábiles", "22,901,954"),
          ],
        ),
      ),
    );
  }

  static Widget _candidato(
      String nombre, String partido, double porcentaje, bool ganador) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(partido,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 10),

          LinearProgressIndicator(value: porcentaje / 100),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$porcentaje%"),
              ganador
                  ? const Text("Ganador",
                  style: TextStyle(color: Colors.orange))
                  : const Text(""),
            ],
          )
        ],
      ),
    );
  }

  static Widget _card(String titulo, String valor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo),
          Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
