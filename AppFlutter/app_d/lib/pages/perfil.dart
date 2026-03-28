import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class perfil extends StatefulWidget {
  const perfil({super.key});

  @override
  State<perfil> createState() => _PerfilState();
}

class _PerfilState extends State<perfil> {

  String nombre = "";
  String correo = "";

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  void cargarDatos() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      var doc = await FirebaseFirestore.instance
          .collection("usuarios")
          .doc(uid)
          .get();

      setState(() {
        nombre = doc['nombre'] ?? "";
        correo = doc['correo'] ?? "";
      });

    } catch (e) {
      print("Error cargando datos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil de Usuario"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            SizedBox(height: 20),

            Text(
              nombre.isEmpty ? "Cargando..." : nombre,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            Text(
              correo.isEmpty ? "" : correo,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            SizedBox(height: 30),

            Divider(),

            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Editar perfil"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Función próximamente")),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Cambiar contraseña"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Función próximamente")),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.history),
              title: Text("Mis citas"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Aquí verás tus citas")),
                );
              },
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {

                  await FirebaseAuth.instance.signOut();

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear();

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/login",
                        (route) => false,
                  );
                },
                icon: Icon(Icons.logout),
                label: Text("Cerrar Sesión"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
