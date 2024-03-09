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
    return GoogleFonts.poppins(
      color: fontColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
