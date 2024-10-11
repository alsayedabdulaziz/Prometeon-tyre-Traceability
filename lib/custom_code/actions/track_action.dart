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

Future trackAction(bool action, String tagID) async {
  _zebra123 ??= Zebra123(callback: _callback);

  if (action) {
    List<String> tags = [];
    tags.add(tagID);
    _zebra123?.startTracking(tags);
  } else {
    _zebra123?.stopTracking();
  }
  // Add your function code here!
}

void _callback(Interfaces interface, Events event, dynamic data) {
  if (event == Events.readRfid && data is List<RfidTag>) {
    _latestTags = data;
  }
}
