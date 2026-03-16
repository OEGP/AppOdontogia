import 'package:app_d/pages/Splash.dart';
import 'package:app_d/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    /* home:Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("My App Bar"),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
        ),
        ],
        ),
        body: Center(
          child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(25),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 64,
          ),
           /* Text(
            "Adentro",
            style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          ), */
        ),
       ),
      ),*/
    );
  }
}

