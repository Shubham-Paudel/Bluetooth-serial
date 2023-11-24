// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:ble/ble_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
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
     body: GetBuilder<BleController>(
        init: BleController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                StreamBuilder<List<ScanResult>>(
                    stream: controller.scanResults,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final data = snapshot.data![index];
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  title: Text(data.device.name),
                                  subtitle: Text(data.device.id.id),
                                  trailing: Text(data.rssi.toString()),
                                ),
                              );
                            });
                      }else{
                          return Center(child: Text("No Device Found"),);
                      }
                    }),
                SizedBox(height: 100,),
                ElevatedButton(onPressed: () =>controller.scanDevices(), child: Text("Scan",style: TextStyle(fontSize: 30),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                minimumSize: Size(100 ,50),
                ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }}