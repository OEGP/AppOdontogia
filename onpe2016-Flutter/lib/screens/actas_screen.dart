import 'package:flutter/material.dart';

class ActasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Actas")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            DropdownButtonFormField(
              items: ["LIMA", "CUSCO"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) {},
              decoration: InputDecoration(labelText: "Departamento"),
            ),

            SizedBox(height: 20),

            _acta("000123", "Contabilizada"),
            _acta("000124", "Observada"),
          ],
        ),
      ),
    );
  }

  Widget _acta(String numero, String estado) {
    return Card(
      child: ListTile(
        title: Text("Acta: $numero"),
        subtitle: Text("Estado: $estado"),
        trailing: TextButton(
          onPressed: () {},
          child: Text("Ver"),
        ),
      ),
    );
  }
}
