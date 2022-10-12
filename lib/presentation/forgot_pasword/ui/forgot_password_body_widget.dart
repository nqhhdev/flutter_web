import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web/app/app.dart';
import 'package:flutter_web/app/routes/app_routing.dart';

import '../../common/common_elevated_button.dart';
import '../../common/dialog/common_dialog.dart';
import '../../common/dialog/loading_dialog.dart';
import '../../common/textfield/common_text_form_field.dart';
import '../bloc/forgot_password_bloc.dart';

class ForgotPasswordBodyWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;

  const ForgotPasswordBodyWidget({
    Key? key,
    required this.textEditingController,
    required this.formKey,
  }) : super(key: key);

  bool get isDisable => textEditingController.value.text.isEmpty;

  void _sendPasswordResetEmail(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context
          .read<ForgotPasswordBloc>()
          .add(SendPasswordResetEmailEvent(textEditingController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SelectableText(
                    "Forgot Password",
                    style: StyleManager.label22,
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SelectableText(
                    "Please Enter Your Email",
                    style: StyleManager.label13,
                  ),
                ),
                const Spacer(flex: 2),
                CommonTextFormField(
                  hintText: "Your email",
                  textEditingController: textEditingController,
                  editComplete: () => _sendPasswordResetEmail(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!value.trim().isValidEmail) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: textEditingController,
                  builder: (context, _, __) => CommonElevatedButton(
                    text: "Send email",
                    buttonColor: !isDisable
                        ? ColorsManager.primaryPurpleColor
                        : ColorsManager.grey,
                    onPressed: !isDisable
                        ? () => _sendPasswordResetEmail(context)
                        : null,
                  ),
                ),
                const Spacer(flex: 5),
                SelectableText(
                  "Text Resend Request",
                  style: StyleManager.label13,
                ),
                SizedBox(height: 36.h),
              ],
            ),
          ),
          listener: (context, state) {
            if (state is SendingForgotPasswordState) {
              LoadingDialog.showLoadingDialog(context);
            } else {
              LoadingDialog.hideLoadingDialog();
            }
            if (state is EmailForgotPasswordSuccessState) {
              CommonDialog.showConfirmationDialog(context,
                  confirmText: "Confirm",
                  showCancel: false,
                  title: "Email send",
                  hasConfirmFunc: true,
                  content: "Request forgot password",
                  confirmFunc: () => Navigator.pushReplacementNamed(
                        context,
                        RouteDefine.loginScreen.name,
                      ));
            }
            if (state is EmailForgotPasswordFailedState) {
              CommonDialog.showErrorDialog(
                context,
                state.error,
              );
            }
          }),
    );
  }
}
