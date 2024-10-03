import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'r_f_i_d_scanning_widget.dart' show RFIDScanningWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RFIDScanningModel extends FlutterFlowModel<RFIDScanningWidget> {
  ///  Local state fields for this page.

  String readingstatus = 'Scanning Stopped';

  List<String> tagid = [];
  void addToTagid(String item) => tagid.add(item);
  void removeFromTagid(String item) => tagid.remove(item);
  void removeAtIndexFromTagid(int index) => tagid.removeAt(index);
  void insertAtIndexInTagid(int index, String item) =>
      tagid.insert(index, item);
  void updateTagidAtIndex(int index, Function(String) updateFn) =>
      tagid[index] = updateFn(tagid[index]);

  String readerstatus = 'Not Connected';

  int listsize = 0;

  int duplicates = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getstatus] action in RFIDScanning widget.
  String? getstatusresponse2;
  // Stores action output result for [Custom Action - getstatus] action in ScanButton widget.
  String? getstatusResponse;
  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - readtagcount] action in ScanButton widget.
  List<RFIDTagsDataStruct>? readTagCountResponse;
  // Stores action output result for [Backend Call - API (GetTagsData)] action in ScanButton widget.
  ApiCallResponse? getTagsDataResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
