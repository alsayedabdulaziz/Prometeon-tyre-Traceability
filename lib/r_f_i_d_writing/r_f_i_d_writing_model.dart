import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'r_f_i_d_writing_widget.dart' show RFIDWritingWidget;
import 'package:flutter/material.dart';

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

  bool haltwritemessage = false;

  String oldepc = '-';

  String barcode = '-';

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
  // Stores action output result for [Custom Action - newReadAction] action in Button widget.
  List<RFIDDateStruct>? newReadActionResponse2;
  // Stores action output result for [Custom Action - getWritingStatus] action in Button widget.
  bool? writingStatus;
  // Stores action output result for [Backend Call - API (VerifyEPCInsertion)] action in Button widget.
  ApiCallResponse? verifyInsertionResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
