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

RFIDDateStruct result;

Future<RFIDDateStruct?> getFirst(List<RFIDDateStruct>? tagsList) async {
  // Add your function code here!
  if (tagsList == null) {
    result.epc = '';
    result.antenna = '';
    result.rssi = -20;
    result.memoryBandData = '';
    result.lockData = '';
    result.distance = 0;
    result.suze = 0;
    result.seen = '';
    return result;
  } else {
    return tagsList[0];
  }
}
