import 'package:flutter/material.dart';
import 'package:plant_manager/components/footer.dart';
import 'package:plant_manager/components/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador De Plantas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gerenciador De Plantas'),
          backgroundColor: Colors.teal,
        ),
        body: Home(),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
