import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_manager/components/form_plant.dart';
import 'package:plant_manager/models/Plant.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> futurePlant;

  Future<List> fetchAll() async {
    const url = 'http://localhost/plant_manager_backend/api/plant';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body).map((p) => Plant.fromJson(p)).toList();
    } else {
      throw Exception('Failed to load the plant');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePlant = fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  customBorder: new CircleBorder(),
                  hoverColor: Colors.teal,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormPlant(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 200,
                    child: Image.asset(
                      'images/plant.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        FutureBuilder(
          future: futurePlant,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            List<dynamic> plants = snapshot.data ?? [];
            return Container(
              child: ListView.builder(
                itemCount: plants.length,
                itemBuilder: (BuildContext context, int index) {
                  Plant plant = plants[index];
                  print(plants);
                  return Text(plants[index].name);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
