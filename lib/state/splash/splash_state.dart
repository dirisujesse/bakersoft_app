import 'package:baker_app/state/state_interface.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class SplashState extends ChangeNotifier implements StateContract {
  static SplashState? _instance;

  static SplashState get instance {
    if (_instance == null) {
      _instance = SplashState();
    }
    return _instance ?? SplashState();
  }

  bool get isLoggedIn => true;

  bool get hasUserData => true;

  @override
  void reset() {}
}
