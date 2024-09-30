// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:zebra123/zebra123.dart';
import 'package:flutter/foundation.dart';

Future initState() async {
  // Add your function code here!
  Zebra123? zebra123;
  ZebraInterfaces interface = ZebraInterfaces.unknown;
  ZebraConnectionStatus connectionStatus = ZebraConnectionStatus.disconnected;
  List<Barcode> barcodes = [];
  List<RfidTag> tags = [];
  bool scanning = false;

  @override
  void initState() {
    zebra123 = Zebra123(callback: callback);
    super.initState();
  }

  void startScan() {
    zebra123?.startScanning();
    setState(() {
      scanning = true;
    });
  }

  void stopScan() {
    zebra123?.stopScanning();
    setState(() {
      scanning = false;
    });
  }

  void callback(ZebraInterfaces interface, ZebraEvents event, dynamic data) {
    this.interface = interface;

    switch (event) {
      case ZebraEvents.readBarcode:
        barcodes.clear();
        if (data is List<Barcode>) {
          for (Barcode barcode in data) {
            barcodes.add(barcode);
            if (kDebugMode)
              print(
                  "Barcode: ${barcode.barcode} Format: ${barcode.format} Seen: ${barcode.seen} Interface: ${barcode.interface} ");
          }
        }
        setState(() {});
        break;

      case ZebraEvents.readRfid:
        tags.clear();
        if (data is List<RfidTag>) {
          for (RfidTag tag in data) {
            tags.add(tag);
            if (kDebugMode)
              print(
                  "Tag: ${tag.id} Rssi: ${tag.rssi}  Seen: ${tag.seen} Interface: ${tag.interface}");
          }
        }
        setState(() {});
        break;

      case ZebraEvents.error:
        if (data is Error) {
          if (kDebugMode) print("Interface: $interface Error: ${data.message}");
        }
        break;

      case ZebraEvents.connectionStatus:
        if (data is ConnectionStatus) {
          if (kDebugMode)
            print("Interface: $interface ConnectionStatus: ${data.status}");
        }
        if (data.status != connectionStatus) {
          setState(() {
            connectionStatus = data.status;
          });
        }
        break;

      default:
        if (kDebugMode) {
          if (kDebugMode) print("Interface: $interface Unknown Event: $event");
        }
    }
  }
}
