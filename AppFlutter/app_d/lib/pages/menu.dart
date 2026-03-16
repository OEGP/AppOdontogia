import 'package:app_d/pages/m_psicologia.dart';
import 'package:app_d/pages/m_rayox.dart';
import 'package:app_d/pages/m_traumatologia.dart';
import 'package:flutter/material.dart';
import 'm_odontologia.dart';


class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo de pagina(Aun no tengoxd)"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "Selecciona un área para marcar tu cita:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [

                    menuCard(
                      Icons.medical_services, "Odontología", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => m_odon()),
                        );
                      },
                    ),
                    menuCard(Icons.accessibility_new, "Traumatología", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => m_trauma()),
                        );
                      },
                    ),

                    menuCard(Icons.psychology, "Psicología", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => m_psicolog()),
                        );
                      },),



                    menuCard(Icons.local_hospital, "Rayos X", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => m_rayox()),
                        );
                      },),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }

  Widget menuCard(IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 60,
              color: Colors.blue,
            ),

            SizedBox(height: 10),

            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )

          ],
        ),
      ),
    );
  }

}
