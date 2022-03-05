import 'dart:developer';

import 'package:flutter/foundation.dart';

class BakerLogger {
  static DateTime get _now => DateTime.now();

  static info(dynamic data) {
    if (kDebugMode) {
      log(
        "MESSAGE -> $data",
        time: _now,
        name: "LIGHTHOUSE::INFO::LOGGER",
        level: 2,
      );
    }
  }

  static severe(dynamic message, {StackTrace? stackTrace, Object? error}) {
    final now = _now;
    log(
      "ERROR -> ${error ?? stackTrace}",
      time: now,
      stackTrace: stackTrace,
      error: error,
      name: "LIGHTHOUSE::ERROR::LOGGER",
      level: 20,
    );
  }
}
