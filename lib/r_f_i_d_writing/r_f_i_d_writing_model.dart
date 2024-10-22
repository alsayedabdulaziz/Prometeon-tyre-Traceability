import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/rssi_settings_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'r_f_i_d_writing_widget.dart' show RFIDWritingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RFIDWritingModel extends FlutterFlowModel<RFIDWritingWidget> {
  ///  Local state fields for this page.

  RFIDDateStruct? scannedTag;
  void updateScannedTagStruct(Function(RFIDDateStruct) updateFn) {
    updateFn(scannedTag ??= RFIDDateStruct());
  }

  String ipcode = '-';

  String data = '-';

  String epc = '-';

  String currentState = 'Scan Barcode';

  bool writingstatus = true;

  bool waitingforwrite = false;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - newReadAction] action in RFIDWriting widget.
  List<RFIDDateStruct>? newReadActionResponse;
  // Stores action output result for [Custom Action - getFirst] action in RFIDWriting widget.
  RFIDDateStruct? firstReadTag;
  // State field(s) for textField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetBarcodeData)] action in textField widget.
  ApiCallResponse? gEtBarcodeDataResponse;
  // Stores action output result for [Custom Action - getWritingStatus] action in Button widget.
  bool? writingStatus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
