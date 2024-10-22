import 'package:flutter/foundation.dart' as foundation;
import 'package:zebra123/zebra123.dart';
import 'dart:developer' as developer;

class AppState extends foundation.ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() {
    return _instance;
  }

  Zebra123? _zebra123;
  Interfaces interface = Interfaces.unknown;
  Status connectionStatus = Status.disconnected;
  List<Barcode> barcodes = [];
  List<RfidTag> tags = [];
  RfidTag? tag;
  bool isScanning = false;
  bool isTracking = false;
  bool writeStatus = false;
  bool noTagsFound = false;

  AppState._internal() {
    _initialize();
  }
  void _initialize() {
    _zebra123 = Zebra123(callback: _callback);
  }

  void startScanning() {
    _zebra123?.startScanning();
    isScanning = true;
    isTracking = false;
    notifyListeners();
  }
  void writeTag(String epc, String epcNew,double password) {
    double? adjustedPassword = password == 0 ? null : password;

    _zebra123?.writeTag(epc,
      epcNew: epcNew,
      password: adjustedPassword,);
  }
  void stopScanning() {
    _zebra123?.stopScanning();
    isScanning = false;
    isTracking = false;
    notifyListeners();
  }

  void startTracking(List<String> tags) {
    _zebra123?.startTracking(tags);
    isScanning = false;
    isTracking = true;
    notifyListeners();
  }

  void stopTracking() {
    _zebra123?.stopTracking();
    isScanning = false;
    isTracking = false;
    notifyListeners();
  }

  void stop() {
    if (isScanning) stopScanning();
    if (isTracking) stopTracking();
  }

  void connect() {
    _zebra123?.connect();
  }

  void disconnect() {
    _zebra123?.disconnect();
  }

  void setMode(){
    _zebra123?.setMode(Modes.rfid);
  }

  void _callback(Interfaces interface, Events event, dynamic data) {
    this.interface = interface;
    developer.log("Callback triggered. Event: $event, Interface: $interface");
    switch (event) {
      case Events.readBarcode:
        barcodes.clear();
        if (data is List<Barcode>) {
          barcodes = data;
          if (foundation.kDebugMode) {
            for (var barcode in barcodes) {
              print("Barcode: ${barcode.barcode} Format: ${barcode.format} Seen: ${barcode.seen} Interface: ${barcode.interface}");
            }
          }
        }
        if (interface == Interfaces.datawedge && isScanning) {
          isScanning = false;
        }
        notifyListeners();
        break;

      case Events.readRfid:
        tags.clear();
        if (data is List<RfidTag>) {
          if (data.isEmpty){
            noTagsFound = true;
          }else{
            noTagsFound = false;
          }
          for (RfidTag tag in data) {
            developer.log("Tag detected: EPC = ${tag.epc}, RSSI = ${tag.rssi}");

            tags.add(tag);
            if (foundation.kDebugMode) {
              print(
                  "Tag: ${tag.epc} Rssi: ${tag.rssi}  Seen: ${tag.seen} Interface: ${tag.interface}");
            }
          }
        }
        if (interface == Interfaces.datawedge && isScanning) {
          isScanning = false;
        }
        notifyListeners();
        break;

      case Events.connectionStatus:
        if (data is ConnectionStatus) {
          if (foundation.kDebugMode) {
            print("Interface: $interface ConnectionStatus: ${data.status}");
          }
          if (data.status != connectionStatus) {
            connectionStatus = data.status;
            notifyListeners();
          }
        }
        break;

      case Events.error:
        if (data is Error && foundation.kDebugMode) {
          print("Interface: $interface Error: ${data.message}");
        }
        break;

      case Events.writeFail:
        print("Interface: $interface Error: ${data.message}");
        writeStatus = false;
        break;

      case Events.writeSuccess:
        print("Interface: $interface, tag Written Successfullly");
        writeStatus = true;
        break;

      default:
        if (foundation.kDebugMode) {
          print("Interface: $interface Unknown Event: $event");
        }
        developer.log("Interface: $interface Unknown Event: $event");
    }
  }
}
