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

  List<RFIDTagsDataStruct> _RFIDTagsList2 = [];
  List<RFIDTagsDataStruct> get RFIDTagsList2 => _RFIDTagsList2;
  set RFIDTagsList2(List<RFIDTagsDataStruct> value) {
    _RFIDTagsList2 = value;
  }

  void addToRFIDTagsList2(RFIDTagsDataStruct value) {
    RFIDTagsList2.add(value);
  }

  void removeFromRFIDTagsList2(RFIDTagsDataStruct value) {
    RFIDTagsList2.remove(value);
  }

  void removeAtIndexFromRFIDTagsList2(int index) {
    RFIDTagsList2.removeAt(index);
  }

  void updateRFIDTagsList2AtIndex(
    int index,
    RFIDTagsDataStruct Function(RFIDTagsDataStruct) updateFn,
  ) {
    RFIDTagsList2[index] = updateFn(_RFIDTagsList2[index]);
  }

  void insertAtIndexInRFIDTagsList2(int index, RFIDTagsDataStruct value) {
    RFIDTagsList2.insert(index, value);
  }
}
