// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:flutter_datawedge/flutter_datawedge.dart';

late FlutterDataWedge fdw;
Future<void>? initScannerResult;
Future initScanner() async {
  // Add your function code here!
  if (Platform.isAndroid) {
    fdw = FlutterDataWedge();
    await fdw.initialize();
    await fdw.createDefaultProfile(profileName: 'Example app profile');
  }
}
