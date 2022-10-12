import 'package:flutter/material.dart';
import 'package:flutter_web/app/app.dart';

extension StringExt on String {
  bool get isValidEmail {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool get alphabetOnlyForEmail {
    RegExp regExp = RegExp('^[0-9a-zA-Z .@]*\$');
    return regExp.hasMatch(this);
  }

  bool get isValidPassword {
    RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    return regExp.hasMatch(this);
  }
}

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {Key? key,
      required this.textEditingController,
      this.obscure = false,
      this.validator,
      this.focusedBorderColor = ColorsManager.primaryPurpleColor,
      this.borderRadius = 16,
      this.enabledBorderColor = ColorsManager.grey,
      this.hintText,
      this.showSuffixIcon = false,
      this.maxLength,
      this.editComplete,
      this.labelText,
      this.haveBorder = true,
      this.maxLines = 1,
      this.fillColor = ColorsManager.white,
      this.filled = false,
      this.errorBorder = ColorsManager.red,
      this.showPrefixIcon = false})
      : super(key: key);

  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final VoidCallback? editComplete;
  final bool obscure;
  final bool showSuffixIcon;
  final bool showPrefixIcon;
  final int? maxLength;
  final String? hintText;
  final Color focusedBorderColor;
  final double borderRadius;
  final Color enabledBorderColor;
  final String? labelText;
  final bool haveBorder;
  final int? maxLines;
  final Color fillColor;
  final Color errorBorder;
  final bool? filled;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: widget.editComplete,
      maxLength: widget.maxLength,
      obscureText: obscureText,
      controller: widget.textEditingController,
      validator: widget.validator,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          filled: widget.filled,
          fillColor: widget.fillColor,
          border: !widget.haveBorder ? InputBorder.none : null,
          errorBorder: widget.haveBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.errorBorder,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius),
                  ),
                )
              : null,
          focusedErrorBorder: widget.haveBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.errorBorder,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius),
                  ),
                )
              : null,
          focusedBorder: widget.haveBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.focusedBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius),
                  ),
                )
              : null,
          enabledBorder: widget.haveBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.enabledBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius),
                  ),
                )
              : null,
          suffixIcon: widget.showSuffixIcon
              ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                )
              : null,
          hintText: widget.hintText,
          labelText: widget.labelText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          prefixIcon: widget.showPrefixIcon
              ? const Icon(
                  Icons.search,
                  color: ColorsManager.primaryPurpleColor,
                )
              : null),
    );
  }
}
