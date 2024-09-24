// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QueriedTagDataStruct extends BaseStruct {
  QueriedTagDataStruct({
    String? tagID,
    String? line,
    String? printDate,
    String? washingCount,
    String? lastTimeWashed,
    String? lifetime,
    String? color,
  })  : _tagID = tagID,
        _line = line,
        _printDate = printDate,
        _washingCount = washingCount,
        _lastTimeWashed = lastTimeWashed,
        _lifetime = lifetime,
        _color = color;

  // "TagID" field.
  String? _tagID;
  String get tagID => _tagID ?? '\"\"';
  set tagID(String? val) => _tagID = val;

  bool hasTagID() => _tagID != null;

  // "Line" field.
  String? _line;
  String get line => _line ?? '\"\"';
  set line(String? val) => _line = val;

  bool hasLine() => _line != null;

  // "PrintDate" field.
  String? _printDate;
  String get printDate => _printDate ?? '\"\"';
  set printDate(String? val) => _printDate = val;

  bool hasPrintDate() => _printDate != null;

  // "WashingCount" field.
  String? _washingCount;
  String get washingCount => _washingCount ?? '\"\"';
  set washingCount(String? val) => _washingCount = val;

  bool hasWashingCount() => _washingCount != null;

  // "LastTimeWashed" field.
  String? _lastTimeWashed;
  String get lastTimeWashed => _lastTimeWashed ?? '\"\"';
  set lastTimeWashed(String? val) => _lastTimeWashed = val;

  bool hasLastTimeWashed() => _lastTimeWashed != null;

  // "Lifetime" field.
  String? _lifetime;
  String get lifetime => _lifetime ?? '\"\"';
  set lifetime(String? val) => _lifetime = val;

  bool hasLifetime() => _lifetime != null;

  // "Color" field.
  String? _color;
  String get color => _color ?? '\'\'';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  static QueriedTagDataStruct fromMap(Map<String, dynamic> data) =>
      QueriedTagDataStruct(
        tagID: data['TagID'] as String?,
        line: data['Line'] as String?,
        printDate: data['PrintDate'] as String?,
        washingCount: data['WashingCount'] as String?,
        lastTimeWashed: data['LastTimeWashed'] as String?,
        lifetime: data['Lifetime'] as String?,
        color: data['Color'] as String?,
      );

  static QueriedTagDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QueriedTagDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'TagID': _tagID,
        'Line': _line,
        'PrintDate': _printDate,
        'WashingCount': _washingCount,
        'LastTimeWashed': _lastTimeWashed,
        'Lifetime': _lifetime,
        'Color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'TagID': serializeParam(
          _tagID,
          ParamType.String,
        ),
        'Line': serializeParam(
          _line,
          ParamType.String,
        ),
        'PrintDate': serializeParam(
          _printDate,
          ParamType.String,
        ),
        'WashingCount': serializeParam(
          _washingCount,
          ParamType.String,
        ),
        'LastTimeWashed': serializeParam(
          _lastTimeWashed,
          ParamType.String,
        ),
        'Lifetime': serializeParam(
          _lifetime,
          ParamType.String,
        ),
        'Color': serializeParam(
          _color,
          ParamType.String,
        ),
      }.withoutNulls;

  static QueriedTagDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      QueriedTagDataStruct(
        tagID: deserializeParam(
          data['TagID'],
          ParamType.String,
          false,
        ),
        line: deserializeParam(
          data['Line'],
          ParamType.String,
          false,
        ),
        printDate: deserializeParam(
          data['PrintDate'],
          ParamType.String,
          false,
        ),
        washingCount: deserializeParam(
          data['WashingCount'],
          ParamType.String,
          false,
        ),
        lastTimeWashed: deserializeParam(
          data['LastTimeWashed'],
          ParamType.String,
          false,
        ),
        lifetime: deserializeParam(
          data['Lifetime'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['Color'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QueriedTagDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QueriedTagDataStruct &&
        tagID == other.tagID &&
        line == other.line &&
        printDate == other.printDate &&
        washingCount == other.washingCount &&
        lastTimeWashed == other.lastTimeWashed &&
        lifetime == other.lifetime &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [tagID, line, printDate, washingCount, lastTimeWashed, lifetime, color]);
}

QueriedTagDataStruct createQueriedTagDataStruct({
  String? tagID,
  String? line,
  String? printDate,
  String? washingCount,
  String? lastTimeWashed,
  String? lifetime,
  String? color,
}) =>
    QueriedTagDataStruct(
      tagID: tagID,
      line: line,
      printDate: printDate,
      washingCount: washingCount,
      lastTimeWashed: lastTimeWashed,
      lifetime: lifetime,
      color: color,
    );
