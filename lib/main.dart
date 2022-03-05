import 'package:baker_app/app.dart';
import 'package:baker_app/data/config/app_config.dart';
import 'package:baker_app/services/storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => startApp();

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await LocalStorage.initDataStore();
  AppConfig.init(store: store);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const BakerApp());
}
