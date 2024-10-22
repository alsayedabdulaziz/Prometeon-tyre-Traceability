import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'location_detection_widget.dart' show LocationDetectionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class LocationDetectionModel extends FlutterFlowModel<LocationDetectionWidget> {
  ///  Local state fields for this page.

  String trackingstatus = 'Scanning Stopped';

  String readerstatus = 'Not Connected';

  double rssi = 0.0;

  String tagID = '--';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getstatus] action in LocationDetection widget.
  String? getstatusresponse2;
  // State field(s) for TagIDInputField widget.
  FocusNode? tagIDInputFieldFocusNode;
  TextEditingController? tagIDInputFieldTextController;
  String? Function(BuildContext, String?)?
      tagIDInputFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetEPC)] action in TagIDInputField widget.
  ApiCallResponse? getEPCDataResponse;
  // Stores action output result for [Custom Action - getstatus] action in ScanButton widget.
  String? getstatusResponse;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - newReadAction] action in ScanButton widget.
  List<RFIDDateStruct>? newReadActionResponse;
  // Stores action output result for [Custom Action - getFirst] action in ScanButton widget.
  RFIDDateStruct? trackedTag;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tagIDInputFieldFocusNode?.dispose();
    tagIDInputFieldTextController?.dispose();

    instantTimer?.cancel();
  }
}
