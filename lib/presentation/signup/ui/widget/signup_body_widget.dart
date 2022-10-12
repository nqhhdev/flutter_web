import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app.dart';
import '../../../../app/routes/app_routing.dart';
import '../../../common/common_elevated_button.dart';
import '../../../common/dialog/loading_dialog.dart';
import '../../../common/textfield/common_text_form_field.dart';
import '../../bloc/signup_bloc.dart';
import '../../bloc/signup_event.dart';
import '../../bloc/signup_state.dart';

class SignUpBodyWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  const SignUpBodyWidget({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  }) : super(key: key);

  void editComplete(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(EmailSignUpEvent(
            emailController.text.trim(),
            passwordController.text.trim(),
            nameController.text,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          LoadingDialog.showLoadingDialog(context);
        } else {
          LoadingDialog.hideLoadingDialog();
        }
        if (state is SignUpFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
        if (state is SignUpSuccessState) {
          Navigator.pushReplacementNamed(
            context,
            RouteDefine.loginScreen.name,
          );
        }
      },
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Account",
                        style: StyleManager.label2,
                      ),
                      Text(
                        "Sign Up To Start",
                        style: StyleManager.label2,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          60.h,
                          0,
                          16.h,
                        ),
                        child: CommonTextFormField(
                          editComplete: () {
                            editComplete(context);
                          },
                          textEditingController: nameController,
                          hintText: "Full Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0.h,
                          0,
                          16.h,
                        ),
                        child: CommonTextFormField(
                          editComplete: () {
                            editComplete(context);
                          },
                          textEditingController: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Email";
                            }
                            if (!value.trim().alphabetOnlyForEmail ||
                                !value.trim().isValidEmail) {
                              return "Invalid Email";
                            }
                            return null;
                          },
                          hintText: "Email",
                        ),
                      ),
                      CommonTextFormField(
                        obscure: true,
                        showSuffixIcon: true,
                        editComplete: () {
                          editComplete(context);
                        },
                        hintText: "Password",
                        textEditingController: passwordController,
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
                      SizedBox(
                        height: 40.h,
                      ),
                      CommonElevatedButton(
                        onPressed: () {
                          editComplete(context);
                        },
                        text: "Sign up",
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account",
                      style: StyleManager.label4.copyWith(
                        color: ColorsManager.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RouteDefine.loginScreen.name,
                      ),
                      child: Text(
                        "Log in",
                        style: StyleManager.label4.copyWith(
                          color: ColorsManager.darkGrey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
