import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web/app/utils/app_scroll_behavior.dart';
import 'package:flutter_web/firebase_options.dart';

import 'app/app.dart';
import 'app/routes/app_routing.dart';
import 'app/utils/navigation_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  await setupInjection();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //color set to transperent or set your own color
    statusBarIconBrightness: Brightness.dark,
    //set brightness for icons, like dark background light icons
  ));

  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeManager appTheme = getIt<ThemeManager>();

  @override
  void initState() {
    appTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    appTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        builder: (context, child) {
          return child ?? const SizedBox();
        },
        scrollBehavior: AppScrollBehavior(),
        title: 'WEB',
        navigatorKey: NavigationUtil.rootKey,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteDefine.splashScreen.name,
        onGenerateRoute: AppRouting.generateRoute,
        theme: ThemeManager.lightTheme,
        darkTheme: ThemeManager.darkTheme,
        themeMode: appTheme.currentTheme,
      ),
    );
  }
}
