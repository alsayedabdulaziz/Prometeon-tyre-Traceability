import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'r_f_i_d_scanning_widget.dart' show RFIDScanningWidget;
import 'package:flutter/material.dart';

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
  // Stores action output result for [Custom Action - newReadAction] action in ScanButton widget.
  List<RFIDDateStruct>? readTagCountResponse;
  // Stores action output result for [Backend Call - API (GetTagsData)] action in ScanButton widget.
  ApiCallResponse? getTagsDataResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
