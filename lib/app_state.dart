import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
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

  List<RFIDDateStruct> _RFIDDataList = [];
  List<RFIDDateStruct> get RFIDDataList => _RFIDDataList;
  set RFIDDataList(List<RFIDDateStruct> value) {
    _RFIDDataList = value;
  }

  void addToRFIDDataList(RFIDDateStruct value) {
    RFIDDataList.add(value);
  }

  void removeFromRFIDDataList(RFIDDateStruct value) {
    RFIDDataList.remove(value);
  }

  void removeAtIndexFromRFIDDataList(int index) {
    RFIDDataList.removeAt(index);
  }

  void updateRFIDDataListAtIndex(
    int index,
    RFIDDateStruct Function(RFIDDateStruct) updateFn,
  ) {
    RFIDDataList[index] = updateFn(_RFIDDataList[index]);
  }

  void insertAtIndexInRFIDDataList(int index, RFIDDateStruct value) {
    RFIDDataList.insert(index, value);
  }
}
