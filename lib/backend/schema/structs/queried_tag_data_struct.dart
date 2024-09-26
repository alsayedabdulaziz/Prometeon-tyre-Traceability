// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QueriedTagDataStruct extends BaseStruct {
  QueriedTagDataStruct({
    String? tagID,
  }) : _tagID = tagID;

  // "TagID" field.
  String? _tagID;
  String get tagID => _tagID ?? '\"\"';
  set tagID(String? val) => _tagID = val;

  bool hasTagID() => _tagID != null;

  static QueriedTagDataStruct fromMap(Map<String, dynamic> data) =>
      QueriedTagDataStruct(
        tagID: data['TagID'] as String?,
      );

  static QueriedTagDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QueriedTagDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'TagID': _tagID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'TagID': serializeParam(
          _tagID,
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
      );

  @override
  String toString() => 'QueriedTagDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QueriedTagDataStruct && tagID == other.tagID;
  }

  @override
  int get hashCode => const ListEquality().hash([tagID]);
}

QueriedTagDataStruct createQueriedTagDataStruct({
  String? tagID,
}) =>
    QueriedTagDataStruct(
      tagID: tagID,
    );
