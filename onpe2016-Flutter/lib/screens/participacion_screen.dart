import 'package:flutter/material.dart';

class ParticipacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Participación")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _item("Lima", "82%"),
          _item("Arequipa", "78%"),
        ],
      ),
    );
  }

  Widget _item(String lugar, String porcentaje) {
    return Card(
      child: ListTile(
        title: Text(lugar),
        trailing: Text(porcentaje),
      ),
    );
  }
}
