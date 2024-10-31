import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _IPConfig = prefs.getString('ff_IPConfig') ?? _IPConfig;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<RFIDDateStruct> _RFIDTagsList = [];
  List<RFIDDateStruct> get RFIDTagsList => _RFIDTagsList;
  set RFIDTagsList(List<RFIDDateStruct> value) {
    _RFIDTagsList = value;
  }

  void addToRFIDTagsList(RFIDDateStruct value) {
    RFIDTagsList.add(value);
  }

  void removeFromRFIDTagsList(RFIDDateStruct value) {
    RFIDTagsList.remove(value);
  }

  void removeAtIndexFromRFIDTagsList(int index) {
    RFIDTagsList.removeAt(index);
  }

  void updateRFIDTagsListAtIndex(
    int index,
    RFIDDateStruct Function(RFIDDateStruct) updateFn,
  ) {
    RFIDTagsList[index] = updateFn(_RFIDTagsList[index]);
  }

  void insertAtIndexInRFIDTagsList(int index, RFIDDateStruct value) {
    RFIDTagsList.insert(index, value);
  }

  bool _RFIDReaderStatus = false;
  bool get RFIDReaderStatus => _RFIDReaderStatus;
  set RFIDReaderStatus(bool value) {
    _RFIDReaderStatus = value;
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

  String _IPConfig = '';
  String get IPConfig => _IPConfig;
  set IPConfig(String value) {
    _IPConfig = value;
    prefs.setString('ff_IPConfig', value);
  }

  dynamic _ScanResult;
  dynamic get ScanResult => _ScanResult;
  set ScanResult(dynamic value) {
    _ScanResult = value;
  }

  double _RssiFilter = -52.0;
  double get RssiFilter => _RssiFilter;
  set RssiFilter(double value) {
    _RssiFilter = value;
  }

  BarcodeDataStruct _ScannedBarcode = BarcodeDataStruct();
  BarcodeDataStruct get ScannedBarcode => _ScannedBarcode;
  set ScannedBarcode(BarcodeDataStruct value) {
    _ScannedBarcode = value;
  }

  void updateScannedBarcodeStruct(Function(BarcodeDataStruct) updateFn) {
    updateFn(_ScannedBarcode);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
