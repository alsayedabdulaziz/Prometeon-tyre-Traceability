// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RFIDDateStruct extends BaseStruct {
  RFIDDateStruct({
    String? epc,
    int? antenna,
    int? rssi,
    int? distance,
    String? memoryBankData,
    String? lockData,
    int? size,
    String? seen,
  })  : _epc = epc,
        _antenna = antenna,
        _rssi = rssi,
        _distance = distance,
        _memoryBankData = memoryBankData,
        _lockData = lockData,
        _size = size,
        _seen = seen;

  // "epc" field.
  String? _epc;
  String get epc => _epc ?? '';
  set epc(String? val) => _epc = val;

  bool hasEpc() => _epc != null;

  // "antenna" field.
  int? _antenna;
  int get antenna => _antenna ?? 0;
  set antenna(int? val) => _antenna = val;

  void incrementAntenna(int amount) => antenna = antenna + amount;

  bool hasAntenna() => _antenna != null;

  // "rssi" field.
  int? _rssi;
  int get rssi => _rssi ?? 0;
  set rssi(int? val) => _rssi = val;

  void incrementRssi(int amount) => rssi = rssi + amount;

  bool hasRssi() => _rssi != null;

  // "distance" field.
  int? _distance;
  int get distance => _distance ?? 0;
  set distance(int? val) => _distance = val;

  void incrementDistance(int amount) => distance = distance + amount;

  bool hasDistance() => _distance != null;

  // "memoryBankData" field.
  String? _memoryBankData;
  String get memoryBankData => _memoryBankData ?? '';
  set memoryBankData(String? val) => _memoryBankData = val;

  bool hasMemoryBankData() => _memoryBankData != null;

  // "lockData" field.
  String? _lockData;
  String get lockData => _lockData ?? '';
  set lockData(String? val) => _lockData = val;

  bool hasLockData() => _lockData != null;

  // "size" field.
  int? _size;
  int get size => _size ?? 0;
  set size(int? val) => _size = val;

  void incrementSize(int amount) => size = size + amount;

  bool hasSize() => _size != null;

  // "seen" field.
  String? _seen;
  String get seen => _seen ?? '';
  set seen(String? val) => _seen = val;

  bool hasSeen() => _seen != null;

  static RFIDDateStruct fromMap(Map<String, dynamic> data) => RFIDDateStruct(
        epc: data['epc'] as String?,
        antenna: castToType<int>(data['antenna']),
        rssi: castToType<int>(data['rssi']),
        distance: castToType<int>(data['distance']),
        memoryBankData: data['memoryBankData'] as String?,
        lockData: data['lockData'] as String?,
        size: castToType<int>(data['size']),
        seen: data['seen'] as String?,
      );

  static RFIDDateStruct? maybeFromMap(dynamic data) =>
      data is Map ? RFIDDateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'epc': _epc,
        'antenna': _antenna,
        'rssi': _rssi,
        'distance': _distance,
        'memoryBankData': _memoryBankData,
        'lockData': _lockData,
        'size': _size,
        'seen': _seen,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'epc': serializeParam(
          _epc,
          ParamType.String,
        ),
        'antenna': serializeParam(
          _antenna,
          ParamType.int,
        ),
        'rssi': serializeParam(
          _rssi,
          ParamType.int,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.int,
        ),
        'memoryBankData': serializeParam(
          _memoryBankData,
          ParamType.String,
        ),
        'lockData': serializeParam(
          _lockData,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.int,
        ),
        'seen': serializeParam(
          _seen,
          ParamType.String,
        ),
      }.withoutNulls;

  static RFIDDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      RFIDDateStruct(
        epc: deserializeParam(
          data['epc'],
          ParamType.String,
          false,
        ),
        antenna: deserializeParam(
          data['antenna'],
          ParamType.int,
          false,
        ),
        rssi: deserializeParam(
          data['rssi'],
          ParamType.int,
          false,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.int,
          false,
        ),
        memoryBankData: deserializeParam(
          data['memoryBankData'],
          ParamType.String,
          false,
        ),
        lockData: deserializeParam(
          data['lockData'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.int,
          false,
        ),
        seen: deserializeParam(
          data['seen'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RFIDDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RFIDDateStruct &&
        epc == other.epc &&
        antenna == other.antenna &&
        rssi == other.rssi &&
        distance == other.distance &&
        memoryBankData == other.memoryBankData &&
        lockData == other.lockData &&
        size == other.size &&
        seen == other.seen;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [epc, antenna, rssi, distance, memoryBankData, lockData, size, seen]);
}

RFIDDateStruct createRFIDDateStruct({
  String? epc,
  int? antenna,
  int? rssi,
  int? distance,
  String? memoryBankData,
  String? lockData,
  int? size,
  String? seen,
}) =>
    RFIDDateStruct(
      epc: epc,
      antenna: antenna,
      rssi: rssi,
      distance: distance,
      memoryBankData: memoryBankData,
      lockData: lockData,
      size: size,
      seen: seen,
    );
