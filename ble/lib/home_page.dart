import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            "BLE",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.menu),
          ),
    ),
    );
  }
}