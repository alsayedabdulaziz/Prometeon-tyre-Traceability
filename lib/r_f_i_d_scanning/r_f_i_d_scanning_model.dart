import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'r_f_i_d_scanning_widget.dart' show RFIDScanningWidget;
import 'package:flutter/material.dart';

class RFIDScanningModel extends FlutterFlowModel<RFIDScanningWidget> {
  ///  Local state fields for this page.

  String readingstatus = 'Scanning Stopped';

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - readtagcount] action in ScanButton widget.
  List<RFIDTagsdataStruct>? readTagCountResponse;
  // Stores action output result for [Custom Action - tagsListToList] action in ScanButton widget.
  List<String>? listOfTags;
  // Stores action output result for [Backend Call - API (GetTagsData)] action in ScanButton widget.
  ApiCallResponse? getTagsDataResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
