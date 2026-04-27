import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResumenScreen(),
    );
  }
}

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

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('resumen')
            .doc('general')
            .snapshots(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("No hay datos en Firestore"));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;

          double actas = (data['actas'] as num).toDouble();
          double participacion = (data['participacion'] as num).toDouble();
          int electores = (data['electores'] as num).toInt();
          List candidatos = data['candidatos'] ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2A49),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Actas Procesadas",
                          style: TextStyle(color: Colors.white70, fontSize: 10)),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("$actas",
                              style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const Text("%",
                              style: TextStyle(color: Colors.amber, fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                ...candidatos.map((c) => _candidato(
                  c['nombre'],
                  c['partido'],
                  (c['porcentaje'] as num).toDouble(),
                  c['ganador'],
                )),

                const SizedBox(height: 20),

                _card("Participación", "$participacion%"),
                _card("Electores Hábiles", electores.toString()),
              ],
            ),
          );
        },
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
                  : const SizedBox(),
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
