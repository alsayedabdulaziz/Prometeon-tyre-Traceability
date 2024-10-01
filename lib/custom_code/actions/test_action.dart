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

AppState appState = AppState();
List<RfidTag> tags = [];
List<RFIDDateStruct> result = [];
Future<List<RFIDDateStruct>> testAction() async {
  // Add your function code here!
  appState.startScan();
  await Future.delayed(Duration(seconds: 2));
  appState.stopScan();
  await Future.delayed(Duration(seconds: 2));
  tags = appState.tags;
  for (int i = 0; i < tags.length; i++) {
    result.add(RFIDDateStruct(
      epc: tags.values.elemntAt(i).epc,
      antenna: tags.values.elemntAt(i).antenna,
      rssi: tags.values.elemntAt(i).rssi,
      distance: tags.values.elemntAt(i).distance,
      memoryBankData: tags.values.elemntAt(i).memoryBankData,
      lockData: tags.values.elemntAt(i).lockData,
      size: tags.values.elemntAt(i).size,
      seen: tags.values.elemntAt(i).seen,
    ));
  }
  return result;
}
