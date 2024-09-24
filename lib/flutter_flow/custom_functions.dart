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

List<String> tgagsListToList(List<RFIDTagsdataStruct> data) {
  List<String> result = [];
  for (var item in data) {
    result.add(item.tagID);
  }
  return result;
}

List<QueriedTagDataStruct>? buildTagsDataList(
  List<String>? id,
  List<String>? printDate,
  List<String>? washingCount,
  List<String>? lastTimeWashed,
  List<String>? line,
  List<String>? lifetime,
  List<String>? color,
) {
  List<QueriedTagDataStruct> result = [];
  if (id == null ||
      printDate == null ||
      washingCount == null ||
      lastTimeWashed == null ||
      line == null ||
      lifetime == null ||
      color == null) {
  } else {
    for (int i = 0; i < id.length; i++) {
      QueriedTagDataStruct element = QueriedTagDataStruct(
        tagID: id[i],
        printDate: printDate[i],
        washingCount: washingCount[i],
        lastTimeWashed: lastTimeWashed[i],
        line: line[i],
        lifetime: lifetime[i],
        color: color[i],
      );
      result.add(element);
    }
  }

  return result;
}

bool isTagsListNotEmpty(List<RFIDTagsdataStruct> listOfRFIDData) {
  if (listOfRFIDData.isEmpty || listOfRFIDData == null) {
    return false;
  } else {
    return true;
  }
}

String remainigDayesInService(
  String lifetime,
  String printdate,
) {
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateTime servicedate = dateFormat.parse(printdate);
  DateTime timeNow = DateTime.now();

  int inServicemillisecconds =
      timeNow.millisecondsSinceEpoch - servicedate.millisecondsSinceEpoch;

  double inServiceDays = inServicemillisecconds / (1000 * 60 * 60 * 24);
  double result = double.parse(lifetime) - inServiceDays;
  if (result < 0) {
    return "0";
  } else {
    return result.floor().toString();
  }
}

String washBefore(
  String lastTimeWashed,
  int washSetPoint,
) {
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateTime washedate = dateFormat.parse(lastTimeWashed);
  int millesecconds =
      washedate.millisecondsSinceEpoch + (washSetPoint * 24 * 60 * 60 * 1000);
  DateTime deadline = DateTime.fromMillisecondsSinceEpoch(millesecconds);
  String year = deadline.year.toString();
  String month = deadline.month.toString();
  String day = deadline.day.toString();
  return "$month/$day/$year";
}

double lifeTime(
  String lifetime,
  String remainingdaysinservice,
) {
  double result = (int.parse(remainingdaysinservice) / int.parse(lifetime));
  if (result < 0) {
    return 1.0;
  } else {
    return (1 - result);
  }
}
