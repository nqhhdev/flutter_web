import 'package:flutter/material.dart';

import '../../presentation/login/login_screen_route.dart';
import '../../presentation/signup/signup_screen_route.dart';
import '../../presentation/splash/splash_screen.dart';

enum RouteDefine {
  ///ADD ROUTE FOR EXAMPLE
  splashScreen,
  loginScreen,
  signUpScreen,
  dashboard,
  transaction,
  task,
  documents,
  store,
  notification,
  profile,
  setting,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.splashScreen.name: (_) => SplashScreenRoute.route,
      RouteDefine.loginScreen.name: (_) => LoginScreenRoute.route,
      RouteDefine.signUpScreen.name: (_) => SignUpScreenRoute.route,
    };

    final routeBuilder = routes[settings.name];

    return _NoAnimationMaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}

class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(_, __, ___, Widget child) => child;
}

extension RouteExt on Object {
  /// Use this to get the enum value converted to string.
  ///
  /// Eg.
  /// ```dart
  /// print(SomeEnum.someValue.name) // someValue
  /// ```
  ///
  String get name => toString().substring(toString().indexOf('.') + 1);
}
