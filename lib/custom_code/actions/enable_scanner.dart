// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:developer';
import 'dart:io';
import 'package:scanwedge/models/barcode_plugin.dart';
import 'package:scanwedge/scanwedge.dart';

Scanwedge? _scanwedgePlugin;
String? _deviceInfo;
final notifierDisableKeystroke = ValueNotifier(true);
final notifierAimType = ValueNotifier(AimType.trigger);

Future enableScanner() async {
  _scanwedgePlugin?.enableScanner();
}
