import 'package:flutter/material.dart';
import '../../../app/utils/navigation_util.dart';

class LoadingDialog {
  static void hideLoadingDialog({bool canPopOtherDialog = false}) {
    if (canPopOtherDialog) {
      if (_dialogIsVisible(NavigationUtil.currentContext!)) {
        Navigator.of(NavigationUtil.currentContext!).pop();
      }
    } else {
      Navigator.of(NavigationUtil.currentContext!).pop();
    }
  }

  static bool _dialogIsVisible(BuildContext context) {
    bool isVisible = false;
    Navigator.popUntil(context, (route) {
      isVisible = route is PopupRoute;
      return !isVisible;
    });
    return isVisible;
  }

  static void showLoadingDialog(BuildContext context) {
    final alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 15),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return alert;
      },
    );
  }
}
