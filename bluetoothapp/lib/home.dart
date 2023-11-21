// ignore_for_file: prefer_const_constructors

import 'package:bluetoothapp/controllers/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
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
            onPressed: () {
            },
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
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                      controller.scanDevices();
                  },
                   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800],foregroundColor: Colors.white,
                   minimumSize: Size(250, 80),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                   ),
                  child: Text(
                    'Scan Devices',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              StreamBuilder<List<ScanResult>>( 
                stream: controller.scanResults,
                builder: (context, snapshot){
                  if(snapshot.hasData)
                  {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                        final data = snapshot.data![index];
                        return Card(  
                          elevation: 2,
                          child: ListTile(  
                            title: Text(data.device.platformName),
                            subtitle: Text(data.device.remoteId.str),
                            trailing: Text(data.rssi.toString()),
                          ),
                        );
                      });    
                  }
                  else{
                    return const Center(  
                      child: Text("No Devices found"),
                    );
                  }
                }
                ),
            ]),
          );
        },
      ),
    );
  }
}
