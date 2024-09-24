// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:zebra_rfid_sdk_plugin/zebra_event_handler.dart';
import 'package:zebra_rfid_sdk_plugin/zebra_rfid_sdk_plugin.dart';

ReaderConnectionStatus status = ReaderConnectionStatus.UnConnection;
Future<String> getstatus() async {
  // Add your function code here!
  ZebraRfidSdkPlugin.setEventHandler(ZebraEngineEventHandler(
    connectionStatusCallback: (result) {
      status = result;
    },
    readRfidCallback: (datas) async {},
    errorCallback: (err) {},
  ));

  switch (status.index) {
    case 0:
      return 'Not Connected';
    case 1:
      return 'Connected';
    case 2:
      return 'Connection error';
  }
  return 'Not Connected';
}
