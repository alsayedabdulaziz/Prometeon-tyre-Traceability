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
import 'package:zebra_rfid_sdk_plugin/zebra_event_handler.dart';
import 'package:zebra_rfid_sdk_plugin/zebra_rfid_sdk_plugin.dart';

Map<String?, RfidData> rfidDatas = {};
ReaderConnectionStatus connectionStatus = ReaderConnectionStatus.UnConnection;

Future<List<RFIDTagsDataStruct>> readtagcount(bool? clear) async {
  // Add your function code here!
  List<RFIDTagsdataStruct> frfid = [];

  if (clear == true) rfidDatas = {};

  addDatas(List<RfidData> datas) async {
    for (var item in datas) {
      var data = rfidDatas[item.tagID];
      if (data != null) {
        if (data.count == null) data.count = 0;
        data.count = data.count + 1;
        data.peakRSSI = item.peakRSSI;
        data.relativeDistance = item.relativeDistance;
      } else
        rfidDatas.addAll({item.tagID: item});
    }
  }

  ZebraRfidSdkPlugin.setEventHandler(ZebraEngineEventHandler(
    readRfidCallback: (datas) async {
      addDatas(datas);
    },
    errorCallback: (err) {
      ZebraRfidSdkPlugin.toast(err.errorMessage);
    },
    connectionStatusCallback: (status) {
      //   connectionStatus = status;
    },
  ));

  for (int i = 0; i < rfidDatas.length; i++) {
    //if (rfidDatas.values.elementAt(i).peakRSSI >= distancelimit.toInt()) {
    frfid.add(RFIDTagsdataStruct(
      tagID: rfidDatas.values.elementAt(i).tagID,
      peakRSSI: rfidDatas.values.elementAt(i).peakRSSI,
    ));
    //}
  }

  return frfid;
}
