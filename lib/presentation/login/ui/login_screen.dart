import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web/app/app.dart';
import 'package:flutter_web/presentation/common/textfield/common_text_form_field.dart';

import '../../../app/routes/app_routing.dart';
import '../../common/common_elevated_button.dart';
import '../../common/dialog/loading_dialog.dart';
import '../../common/dont_have_an_account.dart';
import '../bloc/log_in_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  void editComplete(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(EmailSignInEvent(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 650,
            padding: const EdgeInsets.only(top: 20),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is SignInEmailLoadingState) {
                  LoadingDialog.showLoadingDialog(context);
                } else {
                  LoadingDialog.hideLoadingDialog();
                }
                if (state is SignInEmailFailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
                if (state is SignInEmailSuccessState) {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteDefine.dashboard.name,
                  );
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Welcome",
                                style: StyleManager.label22,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CommonTextFormField(
                              textEditingController: _emailController,
                              editComplete: () {
                                editComplete(context);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Email";
                                }
                                if (!value.trim().isValidEmail) {
                                  return "Invalid Email";
                                }
                                return null;
                              },
                              hintText: "Email",
                            ),
                            SizedBox(height: 10.h),
                            CommonTextFormField(
                              hintText: "Password",
                              showSuffixIcon: true,
                              obscure: true,
                              editComplete: () {
                                editComplete(context);
                              },
                              textEditingController: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Password";
                                } else if (value.length < 6) {
                                  return "Min Password Characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 40.h),
                            SizedBox(
                              height: 50.h,
                              width: 1.sw,
                              child: CommonElevatedButton(
                                onPressed: () {
                                  editComplete(context);
                                },
                                text: "Login",
                              ),
                            ),
                            SizedBox(height: 15.h),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteDefine.forgotPassword.name);
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: StyleManager.label13
                                      .copyWith(color: ColorsManager.darkGrey),
                                )),
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 45.h,
                      child: const DontHaveAnAccount(),
                    ),
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
