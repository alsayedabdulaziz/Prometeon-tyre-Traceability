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
List<Barcode> _latestBarcodes = [];
List<BarcodeDataStruct> _result = [];

Future<BarcodeDataStruct> readBarcodeAction(bool clear) async {
  // Add your function code here!
  _result.clear();
  _latestBarcodes = appState.barcodes;
  if (clear) {
    result.barcode = '';
    appState.barcodes.clear();
    return result;
  } else {
    if (_latestBarcodes.isNotEmpty) {
      result.barcode = _latestBarcodes[0].barcode;
      return result;
    } else {
      return result;
    }
  }
}
