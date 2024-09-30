import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _RFIDReaderStatus = false;
  bool get RFIDReaderStatus => _RFIDReaderStatus;
  set RFIDReaderStatus(bool value) {
    _RFIDReaderStatus = value;
  }

  List<RFIDTagsdataStruct> _RFIDTagsList = [];
  List<RFIDTagsdataStruct> get RFIDTagsList => _RFIDTagsList;
  set RFIDTagsList(List<RFIDTagsdataStruct> value) {
    _RFIDTagsList = value;
  }

  void addToRFIDTagsList(RFIDTagsdataStruct value) {
    RFIDTagsList.add(value);
  }

  void removeFromRFIDTagsList(RFIDTagsdataStruct value) {
    RFIDTagsList.remove(value);
  }

  void removeAtIndexFromRFIDTagsList(int index) {
    RFIDTagsList.removeAt(index);
  }

  void updateRFIDTagsListAtIndex(
    int index,
    RFIDTagsdataStruct Function(RFIDTagsdataStruct) updateFn,
  ) {
    RFIDTagsList[index] = updateFn(_RFIDTagsList[index]);
  }

  void insertAtIndexInRFIDTagsList(int index, RFIDTagsdataStruct value) {
    RFIDTagsList.insert(index, value);
  }

  String _ConnectionStatus = '';
  String get ConnectionStatus => _ConnectionStatus;
  set ConnectionStatus(String value) {
    _ConnectionStatus = value;
  }

  List<QueriedTagDataStruct> _QueriedTagDataList = [];
  List<QueriedTagDataStruct> get QueriedTagDataList => _QueriedTagDataList;
  set QueriedTagDataList(List<QueriedTagDataStruct> value) {
    _QueriedTagDataList = value;
  }

  void addToQueriedTagDataList(QueriedTagDataStruct value) {
    QueriedTagDataList.add(value);
  }

  void removeFromQueriedTagDataList(QueriedTagDataStruct value) {
    QueriedTagDataList.remove(value);
  }

  void removeAtIndexFromQueriedTagDataList(int index) {
    QueriedTagDataList.removeAt(index);
  }

  void updateQueriedTagDataListAtIndex(
    int index,
    QueriedTagDataStruct Function(QueriedTagDataStruct) updateFn,
  ) {
    QueriedTagDataList[index] = updateFn(_QueriedTagDataList[index]);
  }

  void insertAtIndexInQueriedTagDataList(
      int index, QueriedTagDataStruct value) {
    QueriedTagDataList.insert(index, value);
  }

  ZebraInterfaces? _interface = ZebraInterfaces.unknown;
  ZebraInterfaces? get interface => _interface;
  set interface(ZebraInterfaces? value) {
    _interface = value;
  }

  ZebraConnectionStatus? _ZebraconnectionStatus =
      ZebraConnectionStatus.disconnected;
  ZebraConnectionStatus? get ZebraconnectionStatus => _ZebraconnectionStatus;
  set ZebraconnectionStatus(ZebraConnectionStatus? value) {
    _ZebraconnectionStatus = value;
  }

  List<BarcodeDataStruct> _BarcodeList = [];
  List<BarcodeDataStruct> get BarcodeList => _BarcodeList;
  set BarcodeList(List<BarcodeDataStruct> value) {
    _BarcodeList = value;
  }

  void addToBarcodeList(BarcodeDataStruct value) {
    BarcodeList.add(value);
  }

  void removeFromBarcodeList(BarcodeDataStruct value) {
    BarcodeList.remove(value);
  }

  void removeAtIndexFromBarcodeList(int index) {
    BarcodeList.removeAt(index);
  }

  void updateBarcodeListAtIndex(
    int index,
    BarcodeDataStruct Function(BarcodeDataStruct) updateFn,
  ) {
    BarcodeList[index] = updateFn(_BarcodeList[index]);
  }

  void insertAtIndexInBarcodeList(int index, BarcodeDataStruct value) {
    BarcodeList.insert(index, value);
  }

  bool _scanning = false;
  bool get scanning => _scanning;
  set scanning(bool value) {
    _scanning = value;
  }
}
