import 'package:app_d/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getBool('login') ?? false;

    if (isLogged) {
      Navigator.pushReplacementNamed(context, "/menu");
    }
  }

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

                Icon(Icons.lock, size: 70, color: Colors.white),

                SizedBox(height: 10),

                Text("Login",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),

                SizedBox(height: 30),

                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                    hintText: "Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),

                SizedBox(height: 20),

                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Contraseña",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),

                SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {

                      String user = userController.text.trim();
                      String pass = passController.text.trim();

                      if (user.isEmpty || pass.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Completa los campos")),
                        );
                        return;
                      }

                      try {

                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: user,
                          password: pass,
                        );

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('login', true);

                        Navigator.pushReplacementNamed(context, "/menu");

                      } on FirebaseAuthException catch (e) {

                        String mensaje = "Error";

                        if (e.code == 'user-not-found') {
                          mensaje = "Usuario no encontrado";
                        } else if (e.code == 'wrong-password') {
                          mensaje = "Contraseña incorrecta";
                        } else if (e.code == 'invalid-email') {
                          mensaje = "Correo inválido";
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(mensaje)),
                        );
                      }
                    }
                    ,
                    child: Text("Ingresar"),
                  ),
                ),

                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿No tienes cuenta?",
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: Text("Registrarse",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
