// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:zebra123/zebra123.dart';

Zebra123? zebra123;
Interfaces interface = Interfaces.unknown;
Status connectionStatus = Status.disconnected;
List<Barcode> barcodes = [];

List<RfidTag> tags = [];
RfidTag? tag;

bool scanning = false;
bool tracking = false;

Future periodic() async {
  void callback(Interfaces interface, Events event, dynamic data) {
    this.interface = interface;

    switch (event) {
      case Events.readBarcode:
        barcodes.clear();
        if (data is List<Barcode>) {
          for (Barcode barcode in data) {
            barcodes.add(barcode);
            if (kDebugMode) {
              print(
                  "Barcode: ${barcode.barcode} Format: ${barcode.format} Seen: ${barcode.seen} Interface: ${barcode.interface} ");
            }
          }
        }
        if (interface == Interfaces.datawedge && scanning) scanning = false;
        setState(() {});
        break;

      case Events.readRfid:
        tags.clear();
        if (data is List<RfidTag>) {
          for (RfidTag tag in data) {
            tags.add(tag);
            if (kDebugMode) {
              print(
                  "Tag: ${tag.epc} Rssi: ${tag.rssi}  Seen: ${tag.seen} Interface: ${tag.interface}");
            }
          }
        }
        if (interface == Interfaces.datawedge && scanning) scanning = false;
        setState(() {});
        break;

      case Events.error:
        if (data is Error) {
          if (kDebugMode) print("Interface: $interface Error: ${data.message}");
        }
        break;

      case Events.connectionStatus:
        if (data is ConnectionStatus) {
          if (kDebugMode) {
            print("Interface: $interface ConnectionStatus: ${data.status}");
          }
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
