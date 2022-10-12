import 'package:flutter/material.dart';
import 'package:flutter_web/app/app.dart';
import 'package:flutter_web/app/routes/app_routing.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You don't have account",
          style: StyleManager.label4.copyWith(
            color: ColorsManager.grey,
          ),
        ),
        const SizedBox(width: 4.0),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteDefine.signUpScreen.name);
          },
          mouseCursor: SystemMouseCursors.click,
          child: Text(
            "Sign Up",
            style: StyleManager.label4.copyWith(
              color: Colors.grey,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
