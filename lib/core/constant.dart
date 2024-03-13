import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static FirebaseOptions options = const FirebaseOptions(
    apiKey: "AIzaSyAnpxBKkYo-1NwJitB8j45CZN32TefPeAw",
    projectId: "sales-b43bd",
    messagingSenderId: "1016824936796",
    appId: "1:1016824936796:android:87ad558837044ff5536999",
  );
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

class ColorStyle {
  static Color primaryColor = const Color.fromRGBO(13, 110, 253, 1);
  static Color secondColor = const Color.fromRGBO(255, 112, 41, 1);
  static Color gray = const Color.fromRGBO(207, 207, 206, 1);
}

class FontStyleThame {
  static TextStyle textStyle({
    double fontSize = 20,
    Color? fontColor,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.tajawal(
      color: fontColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}

String transform(String value) {
  List<String> parts = value.split(" ");
  String dayOfWeek = parts[0]; // e.g., Tue
  String month = parts[1]; // e.g., Feb
  int day = int.parse(parts[2]); // e.g., 20
  int year = int.parse(parts[3]); // e.g., 2024
  String time = parts[4]; // e.g., 19:05:58
  String timeZone = parts[6]; // e.g., (Eastern European Standard Time)

  List<String> timeParts = time.split(":");
  int hours = int.parse(timeParts[0]);
  int minutes = int.parse(timeParts[1]);
  int seconds = int.parse(timeParts[2]);

  DateTime date =
  DateTime(year, _getMonth(month), day, hours, minutes, seconds);

  DateTime now = DateTime.now();
  int diffInSeconds =
  ((now.millisecondsSinceEpoch - date.millisecondsSinceEpoch) / 1000)
      .floor();

  if (diffInSeconds < 60) {
    return 'Just now';
  } else if (diffInSeconds < 3600) {
    int minutes = (diffInSeconds / 60).floor();
    return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
  } else if (diffInSeconds < 86400) {
    int hours = (diffInSeconds / 3600).floor();
    return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
  } else {
    int days = (diffInSeconds / 86400).floor();
    return '$days ${days == 1 ? 'day' : 'days'} ago';
  }
}

int _getMonth(String month) {
  switch (month) {
    case "Jan":
      return DateTime.january;
    case "Feb":
      return DateTime.february;
    case "Mar":
      return DateTime.march;
    case "Apr":
      return DateTime.april;
    case "May":
      return DateTime.may;
    case "Jun":
      return DateTime.june;
    case "Jul":
      return DateTime.july;
    case "Aug":
      return DateTime.august;
    case "Sep":
      return DateTime.september;
    case "Oct":
      return DateTime.october;
    case "Nov":
      return DateTime.november;
    case "Dec":
      return DateTime.december;
    default:
      throw Exception("Invalid month");
  }
}
