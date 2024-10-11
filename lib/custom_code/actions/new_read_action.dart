// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:zebra123/zebra123.dart';
import 'package:zebra123/bridge.dart';
import 'package:zebra123/classes.dart';
import 'package:zebra123/enums.dart';
import 'package:zebra123/helpers.dart';
import 'package:prometeon_tyres_r_f_i_d/init_state.dart';

Zebra123? _zebra123;
List<RfidTag> _latestTags = [];
List<RFIDDateStruct> _result = [];

Future<List<RFIDDateStruct>> newReadAction() async {
  _zebra123 ??= Zebra123(callback: _callback);

  // Connect if not connected
  if (_zebra123?.connectionStatus != Status.connected) {
    await _zebra123?.connect();
  }

  // Start scanning
  //_zebra123?.startScanning();

  // Return the latest tags
  return _result;
  // Add your function code here!
}

void stopRfidScan() {
  _zebra123?.stopScanning();
}

void _callback(Interfaces interface, Events event, dynamic data) {
  if (event == Events.readRfid && data is List<RfidTag>) {
    _latestTags = data;
  }
}

// Action to get latest tags
List<RfidTag> getLatestTags() {
  return _latestTags;
}
