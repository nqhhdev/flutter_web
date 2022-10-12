import 'package:flutter/material.dart';
import 'package:flutter_web/app/app.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastMessage {
  static void showMessage(
    BuildContext context,
    String msg, {
    Color bgColor = ColorsManager.primaryPurpleColor,
    Color textColor = ColorsManager.red,
    double fontSize = 20,
  }) {
    FToast fToast = getIt<FToast>();
    fToast.init(context);
    fToast.removeCustomToast();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: bgColor,
      webPosition: 'right',
      webBgColor: '#5458F7',
      textColor: textColor,
      fontSize: fontSize.sp,
    );
  }
}
