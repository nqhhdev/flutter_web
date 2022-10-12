import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/app/app.dart';

import '../../app/routes/app_routing.dart';
import '../../gen/assets.gen.dart';

class SplashScreenRoute {
  static Widget get route => const SplashScreen();
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _changeScreen() async {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        context,
        RouteDefine.loginScreen.name,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (MediaQuery.of(context).size.shortestSide < 600) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
    _changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsManager.blue,
              ColorsManager.white,
            ],
            stops: [0.1, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Assets.images.icSplash.image(),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'WEB NQH',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
