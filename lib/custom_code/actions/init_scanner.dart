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

import 'dart:async';
import 'dart:io';
import 'package:flutter_datawedge/flutter_datawedge.dart';

late FlutterDataWedge fdw;
late final StreamSubscription<ScanResult> scanResultSubscription;
late final StreamSubscription<ActionResult> scannerEventSubscription;
late final StreamSubscription<ScannerStatus> scannerStatusSubscription;
Future<void>? initScannerResult;
List<Widget> log = [];

Future initScanner() async {
  // Add your function code here!
  if (Platform.isAndroid) {
    fdw = FlutterDataWedge();
    await fdw.initialize();
    await fdw.createDefaultProfile(profileName: 'Example app profile');
  }
  scanResultSubscription = fdw.onScanResult.listen(onScanResult);
}

void onScanResult(ScanResult event) {
  log.add(_ScanResultLogTile(event));
}

class _ScanResultLogTile extends StatelessWidget {
  const _ScanResultLogTile(this.scanResult);

  final ScanResult scanResult;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(scanResult.labelType),
      subtitle: Text(scanResult.data),
    );
  }
}
