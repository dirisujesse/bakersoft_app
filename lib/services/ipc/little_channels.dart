import 'package:flutter/services.dart';
import 'package:baker_app/services/logging/little_logger.dart';

class BakerChannels {
  // static MethodChannel _channel = new MethodChannel('baker_app');

  static Future<void> copy(String text) async {
    try {
      Clipboard.setData(ClipboardData(text: text));
    } catch (e, t) {
      BakerLogger.severe("$e", stackTrace: t, error: e);
      throw e;
    }
  }
}
