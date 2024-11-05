import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'location_detection_widget.dart' show LocationDetectionWidget;
import 'package:flutter/material.dart';

class LocationDetectionModel extends FlutterFlowModel<LocationDetectionWidget> {
  ///  Local state fields for this page.

  String trackingstatus = 'Scanning Stopped';

  String readerstatus = 'Not Connected';

  double rssi = 0.0;

  String tagID = '-';

  bool barcodemodeset = false;

  bool rfidmodeset = false;

  String? barcode = '-';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getstatus] action in LocationDetection widget.
  String? getstatusresponse2;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - readBarcodeAction] action in LocationDetection widget.
  BarcodeDataStruct? readBarcodeActionResponse;
  // Stores action output result for [Backend Call - API (GetBarcodeData)] action in LocationDetection widget.
  ApiCallResponse? getBarcodeDataReponse;
  // State field(s) for TagIDInputField widget.
  FocusNode? tagIDInputFieldFocusNode;
  TextEditingController? tagIDInputFieldTextController;
  String? Function(BuildContext, String?)?
      tagIDInputFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetBarcodeData)] action in TagIDInputField widget.
  ApiCallResponse? getEPCDataResponse;
  // Stores action output result for [Custom Action - getstatus] action in ScanButton widget.
  String? getstatusResponse;
  InstantTimer? instantTimer2;
  // Stores action output result for [Custom Action - newReadAction] action in ScanButton widget.
  List<RFIDDateStruct>? newReadActionResponse;
  // Stores action output result for [Custom Action - getFirst] action in ScanButton widget.
  RFIDDateStruct? trackedTag;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    tagIDInputFieldFocusNode?.dispose();
    tagIDInputFieldTextController?.dispose();

    instantTimer2?.cancel();
  }
}
