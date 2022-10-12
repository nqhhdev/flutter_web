import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/app.dart';
import '../../../app/routes/app_routing.dart';
import '../../common/common_elevated_button.dart';
import '../../common/dialog/common_dialog.dart';
import '../../common/dialog/loading_dialog.dart';
import '../../common/textfield/common_text_form_field.dart';
import '../bloc/change_password_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _textEditingController = TextEditingController();
  final _currentPwController = TextEditingController();
  final _textEditingController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool get isDisable => _textEditingController.value.text.isEmpty;

  void _sendPasswordResetEmail(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ChangePasswordBloc>().add(SendChangePasswordEvent(
          _currentPwController.text, _textEditingController2.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 650.h,
            padding: EdgeInsets.only(top: 20.h, left: 16, right: 16),
            child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
              listener: (context, state) {
                if (state is ShowLoadingState) {
                  LoadingDialog.showLoadingDialog(context);
                } else {
                  LoadingDialog.hideLoadingDialog();
                }
                if (state is ChangePasswordSuccessState) {
                  CommonDialog.showConfirmationDialog(context,
                      confirmText: "Confirm",
                      showCancel: false,
                      title: "Change password",
                      hasConfirmFunc: true,
                      content: "Successfully",
                      confirmFunc: () => Navigator.pushReplacementNamed(
                            context,
                            RouteDefine.dashboard.name,
                          ));
                }
                if (state is ChangePasswordFailedState) {
                  CommonDialog.showErrorDialog(
                    context,
                    state.error,
                  );
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SelectableText(
                        "Change Password",
                        style: StyleManager.label22,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SelectableText(
                        "Please Enter Your new password",
                        style: StyleManager.label13,
                      ),
                    ),
                    const Spacer(flex: 2),
                    CommonTextFormField(
                      obscure: true,
                      showSuffixIcon: true,
                      hintText: "Current Password",
                      textEditingController: _currentPwController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Password";
                        } else if (!value.isValidPassword) {
                          return "Valid Password";
                        } else if (value.contains(' ')) {
                          return "Not Allow White Space";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CommonTextFormField(
                      obscure: true,
                      showSuffixIcon: true,
                      hintText: "New Password",
                      textEditingController: _textEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Password";
                        } else if (!value.isValidPassword) {
                          return "Valid Password";
                        } else if (value.contains(' ')) {
                          return "Not Allow White Space";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CommonTextFormField(
                      obscure: true,
                      showSuffixIcon: true,
                      hintText: "New Password",
                      textEditingController: _textEditingController2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Confirm Password";
                        } else if (!value.isValidPassword) {
                          return "Valid Password";
                        } else if (value.contains(' ')) {
                          return "Not Allow White Space";
                        } else if (!_textEditingController2.text
                            .contains(_textEditingController.text)) {
                          return "Valid Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.h),
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _textEditingController2,
                      builder: (context, _, __) => CommonElevatedButton(
                        text: "Change password",
                        buttonColor: !isDisable
                            ? ColorsManager.primaryPurpleColor
                            : ColorsManager.grey,
                        onPressed: !isDisable
                            ? () => _sendPasswordResetEmail(context)
                            : null,
                      ),
                    ),
                    const Spacer(flex: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
