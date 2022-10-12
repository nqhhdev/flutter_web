import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web/app/app.dart';

import '../../../app/routes/app_routing.dart';
import '../responsive.dart';
import '../size_config.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        height: SizeConfig.screenHeight,
        color: ColorsManager.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Responsive.isDesktop(context)
                  ? Container(
                      height: 100,
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: SvgPicture.asset('assets/mac-action.svg'),
                      ),
                    )
                  : const SizedBox(
                      height: 50,
                    ),
              iconBuilder(assetName: 'assets/home.svg'),
              iconBuilder(assetName: 'assets/pie-chart.svg'),
              iconBuilder(assetName: 'assets/clipboard.svg'),
              iconBuilder(assetName: 'assets/credit-card.svg'),
              iconBuilder(assetName: 'assets/trophy.svg'),
              iconBuilder(assetName: 'assets/invoice.svg'),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteDefine.changePassword.name);
                },
                icon: Icon(Icons.change_circle_outlined),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(
                    context,
                    RouteDefine.loginScreen.name,
                  );
                },
                icon: Icon(Icons.logout),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

iconBuilder({
  required String assetName,
}) =>
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        assetName,
        color: ColorsManager.bgColor,
      ),
      iconSize: 20,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
    );
