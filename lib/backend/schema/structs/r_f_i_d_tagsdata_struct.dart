// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RFIDTagsdataStruct extends BaseStruct {
  RFIDTagsdataStruct({
    String? tagID,
    int? relativeDistance,
    int? peakRSSI,
    int? count,
    int? antennaID,
    String? memoryBankData,
    String? lockData,
    int? allocatedSize,
  })  : _tagID = tagID,
        _relativeDistance = relativeDistance,
        _peakRSSI = peakRSSI,
        _count = count,
        _antennaID = antennaID,
        _memoryBankData = memoryBankData,
        _lockData = lockData,
        _allocatedSize = allocatedSize;

  // "tagID" field.
  String? _tagID;
  String get tagID => _tagID ?? '';
  set tagID(String? val) => _tagID = val;

  bool hasTagID() => _tagID != null;

  // "relativeDistance" field.
  int? _relativeDistance;
  int get relativeDistance => _relativeDistance ?? 0;
  set relativeDistance(int? val) => _relativeDistance = val;

  void incrementRelativeDistance(int amount) =>
      relativeDistance = relativeDistance + amount;

  bool hasRelativeDistance() => _relativeDistance != null;

  // "peakRSSI" field.
  int? _peakRSSI;
  int get peakRSSI => _peakRSSI ?? 0;
  set peakRSSI(int? val) => _peakRSSI = val;

  void incrementPeakRSSI(int amount) => peakRSSI = peakRSSI + amount;

  bool hasPeakRSSI() => _peakRSSI != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "antennaID" field.
  int? _antennaID;
  int get antennaID => _antennaID ?? 0;
  set antennaID(int? val) => _antennaID = val;

  void incrementAntennaID(int amount) => antennaID = antennaID + amount;

  bool hasAntennaID() => _antennaID != null;

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

  // "allocatedSize" field.
  int? _allocatedSize;
  int get allocatedSize => _allocatedSize ?? 0;
  set allocatedSize(int? val) => _allocatedSize = val;

  void incrementAllocatedSize(int amount) =>
      allocatedSize = allocatedSize + amount;

  bool hasAllocatedSize() => _allocatedSize != null;

  static RFIDTagsdataStruct fromMap(Map<String, dynamic> data) =>
      RFIDTagsdataStruct(
        tagID: data['tagID'] as String?,
        relativeDistance: castToType<int>(data['relativeDistance']),
        peakRSSI: castToType<int>(data['peakRSSI']),
        count: castToType<int>(data['count']),
        antennaID: castToType<int>(data['antennaID']),
        memoryBankData: data['memoryBankData'] as String?,
        lockData: data['lockData'] as String?,
        allocatedSize: castToType<int>(data['allocatedSize']),
      );

  static RFIDTagsdataStruct? maybeFromMap(dynamic data) => data is Map
      ? RFIDTagsdataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tagID': _tagID,
        'relativeDistance': _relativeDistance,
        'peakRSSI': _peakRSSI,
        'count': _count,
        'antennaID': _antennaID,
        'memoryBankData': _memoryBankData,
        'lockData': _lockData,
        'allocatedSize': _allocatedSize,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tagID': serializeParam(
          _tagID,
          ParamType.String,
        ),
        'relativeDistance': serializeParam(
          _relativeDistance,
          ParamType.int,
        ),
        'peakRSSI': serializeParam(
          _peakRSSI,
          ParamType.int,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'antennaID': serializeParam(
          _antennaID,
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
        'allocatedSize': serializeParam(
          _allocatedSize,
          ParamType.int,
        ),
      }.withoutNulls;

  static RFIDTagsdataStruct fromSerializableMap(Map<String, dynamic> data) =>
      RFIDTagsdataStruct(
        tagID: deserializeParam(
          data['tagID'],
          ParamType.String,
          false,
        ),
        relativeDistance: deserializeParam(
          data['relativeDistance'],
          ParamType.int,
          false,
        ),
        peakRSSI: deserializeParam(
          data['peakRSSI'],
          ParamType.int,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        antennaID: deserializeParam(
          data['antennaID'],
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
        allocatedSize: deserializeParam(
          data['allocatedSize'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RFIDTagsdataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RFIDTagsdataStruct &&
        tagID == other.tagID &&
        relativeDistance == other.relativeDistance &&
        peakRSSI == other.peakRSSI &&
        count == other.count &&
        antennaID == other.antennaID &&
        memoryBankData == other.memoryBankData &&
        lockData == other.lockData &&
        allocatedSize == other.allocatedSize;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tagID,
        relativeDistance,
        peakRSSI,
        count,
        antennaID,
        memoryBankData,
        lockData,
        allocatedSize
      ]);
}

RFIDTagsdataStruct createRFIDTagsdataStruct({
  String? tagID,
  int? relativeDistance,
  int? peakRSSI,
  int? count,
  int? antennaID,
  String? memoryBankData,
  String? lockData,
  int? allocatedSize,
}) =>
    RFIDTagsdataStruct(
      tagID: tagID,
      relativeDistance: relativeDistance,
      peakRSSI: peakRSSI,
      count: count,
      antennaID: antennaID,
      memoryBankData: memoryBankData,
      lockData: lockData,
      allocatedSize: allocatedSize,
    );
