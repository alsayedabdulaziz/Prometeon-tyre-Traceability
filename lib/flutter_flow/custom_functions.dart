import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

bool isNull(String? dropDown) {
  if (dropDown == null || dropDown.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool greaterOrEqual(
  double sliderInput,
  String rSSIvalue,
) {
  if ((sliderInput * -1) >= double.parse(rSSIvalue)) {
    return true;
  } else {
    return false;
  }
}

List<String> tagsListToList(List<RFIDDateStruct> data) {
  List<String> result = [];
  for (var item in data) {
    result.add(item.epc);
  }
  return result;
}

List<QueriedTagDataStruct>? buildTagsDataList(
  List<String>? id,
  List<String>? barcode,
) {
  List<QueriedTagDataStruct> result = [];
  if (id == null || barcode == null) {
  } else {
    for (int i = 0; i < id.length; i++) {
      QueriedTagDataStruct element =
          QueriedTagDataStruct(tagID: id[i], barCode: barcode[i]);
      result.add(element);
    }
  }

  return result;
}

bool isTagsListNotEmpty(List<RFIDDateStruct> listOfRFIDData) {
  if (listOfRFIDData.isEmpty || listOfRFIDData == null) {
    return false;
  } else {
    return true;
  }
}
