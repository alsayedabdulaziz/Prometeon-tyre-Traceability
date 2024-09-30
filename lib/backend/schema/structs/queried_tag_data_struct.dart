// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QueriedTagDataStruct extends BaseStruct {
  QueriedTagDataStruct({
    String? tagID,
    String? barCode,
  })  : _tagID = tagID,
        _barCode = barCode;

  // "TagID" field.
  String? _tagID;
  String get tagID => _tagID ?? '\"\"';
  set tagID(String? val) => _tagID = val;

  bool hasTagID() => _tagID != null;

  // "BarCode" field.
  String? _barCode;
  String get barCode => _barCode ?? '\"\"';
  set barCode(String? val) => _barCode = val;

  bool hasBarCode() => _barCode != null;

  static QueriedTagDataStruct fromMap(Map<String, dynamic> data) =>
      QueriedTagDataStruct(
        tagID: data['TagID'] as String?,
        barCode: data['BarCode'] as String?,
      );

  static QueriedTagDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QueriedTagDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'TagID': _tagID,
        'BarCode': _barCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'TagID': serializeParam(
          _tagID,
          ParamType.String,
        ),
        'BarCode': serializeParam(
          _barCode,
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
        barCode: deserializeParam(
          data['BarCode'],
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
        barCode == other.barCode;
  }

  @override
  int get hashCode => const ListEquality().hash([tagID, barCode]);
}

QueriedTagDataStruct createQueriedTagDataStruct({
  String? tagID,
  String? barCode,
}) =>
    QueriedTagDataStruct(
      tagID: tagID,
      barCode: barCode,
    );
