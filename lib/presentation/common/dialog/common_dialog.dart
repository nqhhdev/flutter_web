import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web/app/app.dart';

import '../common_elevated_button.dart';

class CommonDialog {
  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    String? confirmText,
    String? cancelText,
    String? title,
    String? content,
    bool showCancel = true,
    bool hasConfirmFunc = false,
    VoidCallback? confirmFunc,
  }) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.r),
                ),
              ),
              title: Center(
                child: Text(
                  title ?? "Delete Confirm",
                ),
              ),
              content: SizedBox(
                width: 1.sw / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (content != null)
                      Text(
                        content,
                        style: StyleManager.label4,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: CommonElevatedButton(
                              onPressed: hasConfirmFunc
                                  ? confirmFunc
                                  : () {
                                      Navigator.of(context)
                                          .pop(showCancel ? true : null);
                                    },
                              text: confirmText ?? "Confirm",
                              buttonHeight: 40.h,
                              topLeft: 10.r,
                              bottomLeft: 10.r,
                              bottomRight: 10.r,
                              topRight: 10.r,
                            ),
                          ),
                          if (showCancel) ...[
                            SizedBox(width: 10.w),
                            Flexible(
                              child: CommonElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                text: cancelText ?? "Cancel",
                                buttonHeight: 40.h,
                                topLeft: 10.r,
                                bottomLeft: 10.r,
                                bottomRight: 10.r,
                                topRight: 10.r,
                                buttonColor: ColorsManager.white,
                                textColor: ColorsManager.red,
                                borderColor: ColorsManager.red,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }

  //show error dialog
  static void showErrorDialog(BuildContext context, String error) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
          title:const Center(
            child:  Text("Error"),
          ),
          content: Text(
            error,
            style: StyleManager.label3,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
