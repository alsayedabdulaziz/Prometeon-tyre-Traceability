// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarcodeDataStruct extends BaseStruct {
  BarcodeDataStruct({
    String? barcode,
    String? format,
    String? seen,
  })  : _barcode = barcode,
        _format = format,
        _seen = seen;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;

  bool hasBarcode() => _barcode != null;

  // "format" field.
  String? _format;
  String get format => _format ?? '';
  set format(String? val) => _format = val;

  bool hasFormat() => _format != null;

  // "seen" field.
  String? _seen;
  String get seen => _seen ?? '';
  set seen(String? val) => _seen = val;

  bool hasSeen() => _seen != null;

  static BarcodeDataStruct fromMap(Map<String, dynamic> data) =>
      BarcodeDataStruct(
        barcode: data['barcode'] as String?,
        format: data['format'] as String?,
        seen: data['seen'] as String?,
      );

  static BarcodeDataStruct? maybeFromMap(dynamic data) => data is Map
      ? BarcodeDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'barcode': _barcode,
        'format': _format,
        'seen': _seen,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'format': serializeParam(
          _format,
          ParamType.String,
        ),
        'seen': serializeParam(
          _seen,
          ParamType.String,
        ),
      }.withoutNulls;

  static BarcodeDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BarcodeDataStruct(
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        format: deserializeParam(
          data['format'],
          ParamType.String,
          false,
        ),
        seen: deserializeParam(
          data['seen'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BarcodeDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarcodeDataStruct &&
        barcode == other.barcode &&
        format == other.format &&
        seen == other.seen;
  }

  @override
  int get hashCode => const ListEquality().hash([barcode, format, seen]);
}

BarcodeDataStruct createBarcodeDataStruct({
  String? barcode,
  String? format,
  String? seen,
}) =>
    BarcodeDataStruct(
      barcode: barcode,
      format: format,
      seen: seen,
    );
