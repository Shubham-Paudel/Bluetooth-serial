// ignore_for_file: prefer_const_constructors

import 'package:bluetoothapp/controllers/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            "Bluetooth-App",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            Image.asset(
              "lib/images/mypic.png",
            ),
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(),
          child: Icon(
            Icons.bluetooth,
            color: Colors.white,
          )),
      body: GetBuilder<BluetoothController>(
        init: BluetoothController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Scan Devices',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
