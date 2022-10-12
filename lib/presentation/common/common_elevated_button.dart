import 'package:flutter/material.dart';
import 'package:flutter_web/app/app.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.buttonColor = Colors.red,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.topLeft = 30,
    this.bottomLeft = 30,
    this.bottomRight = 30,
    this.topRight = 30,
    this.buttonHeight = 57,
    this.buttonWidth,
    this.textStyle,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final double buttonHeight;
  final double? buttonWidth;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bottomLeft),
                topRight: Radius.circular(topRight),
                topLeft: Radius.circular(topLeft),
                bottomRight: Radius.circular(bottomRight),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            buttonColor,
          ),
        ),
        child: Text(
          text,
          style: textStyle ??
              StyleManager.label3.copyWith(
                color: textColor,
              ),
        ),
      ),
    );
  }
}
