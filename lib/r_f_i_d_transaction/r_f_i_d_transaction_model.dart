import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'r_f_i_d_transaction_widget.dart' show RFIDTransactionWidget;
import 'package:flutter/material.dart';

class RFIDTransactionModel extends FlutterFlowModel<RFIDTransactionWidget> {
  ///  Local state fields for this page.

  String operation = 'Lock';

  RFIDDateStruct? scannedTag;
  void updateScannedTagStruct(Function(RFIDDateStruct) updateFn) {
    updateFn(scannedTag ??= RFIDDateStruct());
  }

  String ipcode = '-';

  String data = '-';

  String epc = '-';

  String barcode = '-';

  bool barcodemodeset = false;

  bool rfidmodeset = false;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - newReadAction] action in RFIDTransaction widget.
  List<RFIDDateStruct>? newReadActionResponse;
  // Stores action output result for [Custom Action - getFirst] action in RFIDTransaction widget.
  RFIDDateStruct? firstReadTag;
  // Stores action output result for [Custom Action - readBarcodeAction] action in RFIDTransaction widget.
  BarcodeDataStruct? readBarcodeActionResponse;
  // Stores action output result for [Backend Call - API (GetBarcodeData)] action in RFIDTransaction widget.
  ApiCallResponse? getBarcodeDataReponse;
  // State field(s) for scanthebarcode widget.
  FocusNode? scanthebarcodeFocusNode;
  TextEditingController? scanthebarcodeTextController;
  String? Function(BuildContext, String?)?
      scanthebarcodeTextControllerValidator;
  // State field(s) for OperationDropDown widget.
  String? operationDropDownValue;
  FormFieldController<String>? operationDropDownValueController;
  // State field(s) for BankDropDown widget.
  String? bankDropDownValue;
  FormFieldController<String>? bankDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    scanthebarcodeFocusNode?.dispose();
    scanthebarcodeTextController?.dispose();
  }

  /// Action blocks.
  Future test(BuildContext context) async {}
}
