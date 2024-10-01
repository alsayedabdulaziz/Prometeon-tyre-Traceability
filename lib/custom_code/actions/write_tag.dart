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
Future writeTag(String epc) async {
  // Add your function code here!
  appState.startWrite(epc);
}