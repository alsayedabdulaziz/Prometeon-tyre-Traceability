import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'new_reading_widget.dart' show NewReadingWidget;
import 'package:flutter/material.dart';

class NewReadingModel extends FlutterFlowModel<NewReadingWidget> {
  ///  Local state fields for this page.

  String rfidstatus = 'na';

  List<String> tagid = [];
  void addToTagid(String item) => tagid.add(item);
  void removeFromTagid(String item) => tagid.remove(item);
  void removeAtIndexFromTagid(int index) => tagid.removeAt(index);
  void insertAtIndexInTagid(int index, String item) =>
      tagid.insert(index, item);
  void updateTagidAtIndex(int index, Function(String) updateFn) =>
      tagid[index] = updateFn(tagid[index]);

  List<String> id = [];
  void addToId(String item) => id.add(item);
  void removeFromId(String item) => id.remove(item);
  void removeAtIndexFromId(int index) => id.removeAt(index);
  void insertAtIndexInId(int index, String item) => id.insert(index, item);
  void updateIdAtIndex(int index, Function(String) updateFn) =>
      id[index] = updateFn(id[index]);

  List<String> line = [];
  void addToLine(String item) => line.add(item);
  void removeFromLine(String item) => line.remove(item);
  void removeAtIndexFromLine(int index) => line.removeAt(index);
  void insertAtIndexInLine(int index, String item) => line.insert(index, item);
  void updateLineAtIndex(int index, Function(String) updateFn) =>
      line[index] = updateFn(line[index]);

  List<String> washingcount = [];
  void addToWashingcount(String item) => washingcount.add(item);
  void removeFromWashingcount(String item) => washingcount.remove(item);
  void removeAtIndexFromWashingcount(int index) => washingcount.removeAt(index);
  void insertAtIndexInWashingcount(int index, String item) =>
      washingcount.insert(index, item);
  void updateWashingcountAtIndex(int index, Function(String) updateFn) =>
      washingcount[index] = updateFn(washingcount[index]);

  List<String> lasttimewashed = [];
  void addToLasttimewashed(String item) => lasttimewashed.add(item);
  void removeFromLasttimewashed(String item) => lasttimewashed.remove(item);
  void removeAtIndexFromLasttimewashed(int index) =>
      lasttimewashed.removeAt(index);
  void insertAtIndexInLasttimewashed(int index, String item) =>
      lasttimewashed.insert(index, item);
  void updateLasttimewashedAtIndex(int index, Function(String) updateFn) =>
      lasttimewashed[index] = updateFn(lasttimewashed[index]);

  List<String> printdate = [];
  void addToPrintdate(String item) => printdate.add(item);
  void removeFromPrintdate(String item) => printdate.remove(item);
  void removeAtIndexFromPrintdate(int index) => printdate.removeAt(index);
  void insertAtIndexInPrintdate(int index, String item) =>
      printdate.insert(index, item);
  void updatePrintdateAtIndex(int index, Function(String) updateFn) =>
      printdate[index] = updateFn(printdate[index]);

  List<String> lifetime = [];
  void addToLifetime(String item) => lifetime.add(item);
  void removeFromLifetime(String item) => lifetime.remove(item);
  void removeAtIndexFromLifetime(int index) => lifetime.removeAt(index);
  void insertAtIndexInLifetime(int index, String item) =>
      lifetime.insert(index, item);
  void updateLifetimeAtIndex(int index, Function(String) updateFn) =>
      lifetime[index] = updateFn(lifetime[index]);

  int listsize = 0;

  List<String> color = [];
  void addToColor(String item) => color.add(item);
  void removeFromColor(String item) => color.remove(item);
  void removeAtIndexFromColor(int index) => color.removeAt(index);
  void insertAtIndexInColor(int index, String item) =>
      color.insert(index, item);
  void updateColorAtIndex(int index, Function(String) updateFn) =>
      color[index] = updateFn(color[index]);

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer2;
  // Stores action output result for [Custom Action - getstatus] action in NewReading widget.
  String? getStatusResponse;
  // Stores action output result for [Custom Action - readtagcount] action in NewReading widget.
  List<RFIDTagsdataStruct>? rfidtagdata;
  // Stores action output result for [Backend Call - API (GetTagsData)] action in NewReading widget.
  ApiCallResponse? getTagsDataResponse;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Custom Action - readtagcount] action in Slider widget.
  List<RFIDTagsdataStruct>? readTagCountResponse;
  // Stores action output result for [Backend Call - API (GetTagsData)] action in Slider widget.
  ApiCallResponse? getTagsDataRsponse1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer2?.cancel();
  }
}
