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

Future createProfile() async {
  // Add your function code here!
  try {
    log('_createProfile()-${await _scanwedgePlugin?.createScanProfile(_scanwedgePlugin?.manufacturer == 'ZEBRA' ? ZebraProfileModel(profileName: 'DemoProfile', enabledBarcodes: [
          BarcodeConfig(barcodeType: BarcodeTypes.code39),
          BarcodeConfig(barcodeType: BarcodeTypes.code128),
          BarcodeConfig(barcodeType: BarcodeTypes.ean8),
          BarcodeConfig(barcodeType: BarcodeTypes.ean13),
          BarcodeConfig(barcodeType: BarcodeTypes.i2of5),
        ], enableKeyStroke: !notifierDisableKeystroke.value, aimType: notifierAimType.value) : ProfileModel(profileName: 'DemoProfile', enabledBarcodes: [
          BarcodeTypes.code128.create(minLength: 10, maxLength: 15),
          BarcodeTypes.qrCode.create(),
        ], keepDefaults: false))}');
  } catch (e) {
    log('_createProfile Exception: $e');
  }
}
