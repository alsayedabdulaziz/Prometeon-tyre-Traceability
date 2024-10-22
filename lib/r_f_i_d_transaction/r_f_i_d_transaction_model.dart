import '/flutter_flow/flutter_flow_util.dart';
import 'r_f_i_d_transaction_widget.dart' show RFIDTransactionWidget;
import 'package:flutter/material.dart';

class RFIDTransactionModel extends FlutterFlowModel<RFIDTransactionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for scanthebarcode widget.
  FocusNode? scanthebarcodeFocusNode;
  TextEditingController? scanthebarcodeTextController;
  String? Function(BuildContext, String?)?
      scanthebarcodeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    scanthebarcodeFocusNode?.dispose();
    scanthebarcodeTextController?.dispose();
  }
}
