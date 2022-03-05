import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';

class BakerHelpers {
  static _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  static num? extractAmount(String? amount) {
    if (amount == null || amount.isEmpty) {
      return null;
    } else {
      final val =
          (amount.startsWith("\$") ? amount.substring(1) : amount).trim();
      final number =
          num.tryParse(val.replaceAll(RegExp(r'[^0-9\.]'), "").trim());
      return number;
    }
  }

  static String lower(String text) => text.toLowerCase();
  static String upper(String text) => text.toUpperCase();
  static String initials(String text) => text[0];

  static bool contains(String base, String comparator) =>
      lower(base).contains(lower(comparator));

  static String concatenateString(String prefix, String suffix,
      {String concatenant = ""}) {
    return "$prefix$concatenant$suffix";
  }

  static String getTimeFromDuration(Duration duration) {
    final durationString = duration.toString().split(".").first;
    final hourMinSec = durationString.split(":");
    String length = "";
    hourMinSec.forEach((it) {
      final isFirst = hourMinSec.indexOf(it) == 0;
      final trailing = it != hourMinSec.last ? ":" : "";
      if (!isFirst && it != "0") {
        length += it.length == 1 ? "0$it$trailing" : "$it$trailing";
      }
    });
    return length;
  }

  static String extractMessage(dynamic data, {String defaultMessage = ""}) {
    try {
      if (data is Map) {
        if (data["message"] != null && data["message"] is String) {
          final String message = data["message"] ?? "";
          if (message.isNotEmpty) {
            return message;
          }
        }
      }
      if (data is String) {
        return data.isNotEmpty ? data : defaultMessage;
      }
      return defaultMessage;
    } catch (_) {
      return defaultMessage;
    }
  }

  static String parseError(
    dynamic error, {
    String defaultMessage =
        "Your request failed due to an unexpected error, please try again",
  }) {
    try {
      log("XXX: ${error.runtimeType.toString()}");
      if (error is Map) {
        if (error["error"] != null &&
            error["error"] is String &&
            error["error"].isNotEmpty) {
          return error["error"];
        } else if (error.containsKey("errors") && error["errors"] != null) {
          return _parseErrorArray(error["errors"]) ??
              _fallBackMessage(1000, defaultMessage);
        } else if (error.containsKey("message") &&
            error["message"] != null &&
            error["message"] is String) {
          final String message = error["message"] ?? "";
          if (message.isNotEmpty) {
            return message;
          }
        } else {
          if (error.containsKey("data") && error["data"] != null) {
            return parseError(error["data"]);
          }
          return _fallBackMessage(1000, defaultMessage);
        }
      }
      if (error is String) {
        return error.isNotEmpty
            ? error
            : _fallBackMessage(1000, defaultMessage);
      }
      return _fallBackMessage(1000, defaultMessage);
    } catch (_) {
      return defaultMessage;
    }
  }

  static String parseSuccess(dynamic data, String? defaultMessage) {
    final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
        ? defaultMessage
        : "Success";
    try {
      if (data is Map) {
        if (data["message"] != null &&
            data["message"] is String &&
            data["message"].isNotEmpty) {
          return data["message"];
        }
        return fallbackMessage;
      }
      return fallbackMessage;
    } catch (_) {
      return fallbackMessage;
    }
  }

  static String? _parseErrorArray(List errors) {
    try {
      List errorMessages = [];
      errors.forEach((it) {
        errorMessages.add(it["message"]);
      });
      return errorMessages.join(", ");
    } catch (_) {
      return null;
    }
  }

  static String _fallBackMessage(int statusCode, String defaultMessage) {
    if (statusCode == 405) {
      return "Sorry, you are not permitted to carry out this action at this time";
    } else if (statusCode == 404) {
      return "Sorry, the requested data could not be found at this time";
    } else if (statusCode >= 400 && statusCode < 500) {
      return "Sorry, your request could not be resolved at this time, please retry";
    } else if (statusCode >= 500 && statusCode < 600) {
      return "Sorry, your request could not be resolved at this time because of an unexpected error";
    } else {
      return defaultMessage;
    }
  }
}
