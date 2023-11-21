// ignore_for_file: deprecated_member_use

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController{
  FlutterBluePlus flutterBlue = FlutterBluePlus();

  Future scanDevices() async{
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.stopScan();
  }

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;
}
