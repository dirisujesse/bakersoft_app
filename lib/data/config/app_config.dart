import 'package:baker_app/objectbox.g.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static AppConfig? _instance;
  final Store store;

  AppConfig({required this.store});

   static AppConfig get instance {
    if (_instance == null) {
      _instance = AppConfig(store: Store(getObjectBoxModel()));
    }
    return _instance!;
  }

  static GlobalKey<NavigatorState> navigator = GlobalKey(
    debugLabel: "navGenerale",
  );

  static init({
    required Store store
  }) async {
    _instance = AppConfig(store: store);
  }
}
