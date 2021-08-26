import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class FormPlant extends StatefulWidget {
  @override
  _FormPlantState createState() => _FormPlantState();
}

class _FormPlantState extends State<FormPlant> {
  final TextEditingController _controllerName = TextEditingController();

  void submit() {
    final String name = _controllerName.text;

    String url = "http://localhost/plant_manager_backend/api/plant";
    http.post(Uri.parse(url), body: {
      'name': name,
    }).then((response) {
      if (response.statusCode == 201) {
        exibirDialogo();
        clearText();
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    });
  }

  void exibirDialogo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Planta Salva'),
            content: Image.asset(
              'images/plant.gif',
              width: 200,
              height: 200,
            ),
          );
        });
  }

  void clearText() {
    _controllerName.clear();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar Planta',
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.all(12),
          child: new ListView(
            children: <Widget>[
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome da planta',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    onPressed: () {
                      submit();
                    },
                    child: Text("Salvar"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
