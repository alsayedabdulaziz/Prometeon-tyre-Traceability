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
import 'package:flutter/foundation.dart' as foundation;

import 'package:flutter/services.dart';
import 'package:zebra123/zebra123.dart';
import 'package:zebra123/bridge.dart';
import 'package:zebra123/classes.dart';
import 'package:zebra123/enums.dart';
import 'package:zebra123/helpers.dart';
import 'package:prometeon_tyres_r_f_i_d/init_state.dart';
import 'dart:developer' as developer;

AppState appState = AppState();

BarcodeDataStruct result = BarcodeDataStruct();
Future<BarcodeDataStruct> readBarcodeAction(bool clear) async {
  // Add your function code here!
  if (clear) {
    return result;
  } else {
    result(BarcodeDataStruct(
        barcode: appState.barcodes[0].data,
        format: appState.barcodes[0].format,
        seen: appState.barcodes[0].seen));
    return result;
  }
}