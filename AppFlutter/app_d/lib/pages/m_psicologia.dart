import 'package:flutter/material.dart';


class m_psicolog extends StatefulWidget {
  const m_psicolog ({super.key});

  @override
  State<m_psicolog > createState() => m_psicologState();
}

class m_psicologState extends State<m_psicolog > {

  DateTime? fechaSeleccionada;
  String? horaSeleccionada;
  String? TipoDeConsulta;

  List<String> horas = [
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "1:00 PM",
    "1:30 PM",
    "2:00 PM",
    "2:30 PM",
    "3:00 PM",
  ];

  List<String> consulta = [
  "Consulta psicológica",
  "Terapia individual",
  "Terapia de pareja",
 "Terapia familiar",
  "Evaluación psicológica",
  "Orientación emocional",
  "Manejo del estrés",
  "Tratamiento de ansiedad",
  ];

  Future seleccionarFecha() async {
    DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (fecha != null) {
      setState(() {
        fechaSeleccionada = fecha;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cita Psicologia"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Selecciona la fecha:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: seleccionarFecha,
              child: Text(
                fechaSeleccionada == null
                    ? "Elegir fecha"
                    : "${fechaSeleccionada!.day}/${fechaSeleccionada!.month}/${fechaSeleccionada!.year}",
              ),
            ),

            SizedBox(height: 30),

            Text(
              "Selecciona la hora:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            DropdownButtonFormField(
              hint: Text("Seleccionar hora"),
              value: horaSeleccionada,
              items: horas.map((hora) {
                return DropdownMenuItem(
                  value: hora,
                  child: Text(hora),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  horaSeleccionada = value;
                });
              },
            ),

            SizedBox(height: 40),

            Text(
              "Selecciona el tipo de consulta:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            DropdownButtonFormField<String>(
              hint: Text("Seleccionar tipo de consulta"),
              value: TipoDeConsulta,
              items: consulta.map((consultad) {
                return DropdownMenuItem<String>(
                  value: consultad,
                  child: Text(consultad),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  TipoDeConsulta = value;
                });
              },
            ),


            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Confirmar Cita"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

