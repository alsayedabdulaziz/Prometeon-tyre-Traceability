import '/flutter_flow/flutter_flow_util.dart';
import 'r_f_i_d_writing_widget.dart' show RFIDWritingWidget;
import 'package:flutter/material.dart';

class RFIDWritingModel extends FlutterFlowModel<RFIDWritingWidget> {
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
