import 'package:app_d/pages/login.dart';
import 'package:app_d/pages/menu.dart';
import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(

        child: ElevatedButton(
          child: Text("Empezar"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => login(),
              ),
            );
          },
        ),
      ),
    );
  }
}