part of app_layer;

GetIt getIt = GetIt.instance;

Future setupInjection() async {
  await _registerAppComponents();
  await _registerNetworkComponents();
}

Future _registerAppComponents() async {
  final sharedPreferencesManager = await SharedPreferencesManager.getInstance();
  getIt.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager!);

  final appTheme = ThemeManager();
  getIt.registerSingleton(appTheme);
  getIt.registerSingleton(AuthRepository());
  getIt.registerSingleton(FToast());
}

Future<void> _registerNetworkComponents() async {}
