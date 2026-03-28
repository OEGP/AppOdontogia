import 'package:app_d/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _RegisterState();
}

class _RegisterState extends State<register> {

  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [

                Icon(
                  Icons.person_add,
                  size: 70,
                  color: Colors.white,
                ),

                SizedBox(height: 10),

                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 25),

                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                    hintText: "Usuario",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Correo",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Contraseña",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: confirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: "Confirmar contraseña",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {

                      String nombre = userController.text.trim();
                      String email = emailController.text.trim();
                      String pass = passController.text.trim();

                      try {
                        UserCredential userCred = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: pass,
                        );

                        String uid = userCred.user!.uid;

                        await FirebaseFirestore.instance
                            .collection("usuarios")
                            .doc(uid)
                            .set({
                          "nombre": nombre,
                          "correo": email,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registro exitoso")),
                        );

                        Navigator.pushReplacementNamed(context, "/menu");

                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("Registrarse"),
                  ),
                ),

                SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => login(),
                      ),
                    );
                  },
                  child: Text(
                    "¿Ya tienes cuenta? Inicia sesión",
                    style: TextStyle(color: Colors.white),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

