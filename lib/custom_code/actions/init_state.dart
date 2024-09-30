// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:zebra123/zebra123.dart';

Future initState() async {
  // Add your function code here!
  Zebra123? zebra123;
  ZebraInterfaces interface = ZebraInterfaces.unknown;
  ZebraConnectionStatus connectionStatus = ZebraConnectionStatus.disconnected;
  List<BarcodeData> barcodes = [];
  List<RFIDTagsData> tags = [];
  bool scanning = false;

  @override
  void initState() {
    zebra123 = Zebra123(callback: callback);
    super.initState();
  }

  void startScan() {
    zebra123?.scan(ZebraScanRequest.rfidStartInventory);
    setState(() {
      scanning = true;
    });
  }

  void stopScan() {
    zebra123?.scan(ZebraScanRequest.rfidStopInventory);
    setState(() {
      scanning = false;
    });
  }
}
