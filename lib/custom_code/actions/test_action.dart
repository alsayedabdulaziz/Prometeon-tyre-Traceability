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
import 'package:prometeon_tyres_r_f_i_d/init_state.dart';

AppState appState = AppState();
List<RfidTag> tags = [];
List<RFIDDateStruct> result = [];
Future<List<RFIDDateStruct>> testAction() async {
  // Add your function code here!
  appState.startScan();
  await Future.delayed(Duration(seconds: 1));
  appState.stopScan();
  await Future.delayed(Duration(seconds: 1));
  tags = appState.tags;
  for (int i = 0; i < tags.length; i++) {
    result.add(RFIDDateStruct(
      epc: tags[i].epc,
      antenna: tags[i].antenna,
      rssi: tags[i].rssi,
      distance: tags[i].distance,
      memoryBankData: tags[i].memoryBankData,
      lockData: tags[i].lockData,
      size: tags[i].size,
      seen: tags[i].seen,
    ));
  }
  return result;
}
