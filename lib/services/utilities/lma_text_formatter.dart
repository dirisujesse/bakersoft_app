import 'package:baker_app/services/logging/little_logger.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:baker_app/data/constants/regex.dart';
import 'package:baker_app/data/constants/strings.dart';
import 'package:baker_app/services/utilities/lma_date_utilities.dart';

class BakerTextFormatter {
  static String formatPhone(String tel) {
    if (tel.length == 10) {
      return "${tel.substring(0, 3)} ${tel.substring(3, 6)} ${tel.substring(6)}";
    } else if (tel.length == 11) {
      return "${tel.substring(0, 4)} ${tel.substring(4, 7)} ${tel.substring(7)}";
    } else {
      tel = tel.padRight(13, "*");
      return "+${tel.substring(0, 3)} ${tel.substring(3, 6)} ${tel.substring(6, 9)} ${tel.substring(9)}";
    }
  }

  static String formatMobileNumber(
    String mobileNum, {
    bool hasCountryCode = true,
  }) {
    mobileNum = mobileNum.replaceAll(" ", '');
    if (hasCountryCode) {
      mobileNum = mobileNum.length == 10 ? mobileNum : mobileNum.substring(1);
      return mobileNum;
    } else {
      return mobileNum;
    }
  }

  static String formatOrdinal(num digit) {
    String suffix = 'th';
    if (digit == 1) suffix = 'st';
    if (digit == 2) suffix = 'nd';
    if (digit == 3) suffix = 'rd';

    return "$digit$suffix";
  }

  static String timeSince(String? date, {bool periodAgo = false}) {
    if (date == null || date.isEmpty) {
      return "some time ago";
    }
    final datetime = DateTime.tryParse(date);
    if (datetime == null) {
      return "some time ago";
    }
    final now = DateTime.now();
    if (BakerDateUtil.isSameDay(firstDate: now, secondDate: datetime)) {
      final hoursPast = datetime.difference(now).inHours;
      if (hoursPast <= 0) return "moments ago";
      if (hoursPast == 1) return "an hour ago";
      return "$hoursPast hours ago";
    }
    final daysPast = now.difference(datetime).inDays;
    if (daysPast <= 1) return "yesterday";

    if (periodAgo) return "$daysPast days ago";

    return formatDate(datetime.toIso8601String(),
        format: "MMM d, yyyy HH:mm aa");
  }

  static String formatDate(String? date, {String? format, String? fallback}) {
    DateFormat formatter =
        format == null ? DateFormat("d - MM - yyyy") : DateFormat(format);
    if (date == null || date.isEmpty) {
      return fallback ?? formatter.format(DateTime.now());
    }
    final datetime = DateTime.tryParse(date);
    if (datetime == null) {
      return fallback ?? formatter.format(DateTime.now());
    }
    return formatter.format(datetime);
  }

  static String? capitalise(String? text, {bool onlyFirst = false}) {
    try {
      if (text == null || text.isEmpty) {
        return text ?? "";
      } else if (text.length == 1) {
        return text.toUpperCase();
      } else if (text.length > 1 && onlyFirst) {
        final firstChar = text[0];
        return "${firstChar.toUpperCase()}${text.substring(1).toLowerCase()}";
      } else {
        final textSpan = text.split(" ").map((it) {
          if (it.isEmpty) {
            return it;
          }
          if (it.length == 1) {
            return it.toUpperCase();
          }
          final firstChar = it[0];
          return "${firstChar.toUpperCase()}${it.substring(1).toLowerCase()}";
        });
        return textSpan.join(" ");
      }
    } catch (e, t) {
      BakerLogger.severe("$e", stackTrace: t, error: e);
      return text;
    }
  }

  static String formatCurrency(
    num? value, {
    bool spaceIcon = false,
    bool ignoreSymbol = false,
    String? symbol,
    int decimalDigits = 2,
  }) {
    String amount = "${value ?? ''}";
    String _symbol = (symbol ?? BakerStrings.euro);
    final formatter = NumberFormat.currency(
      locale: "de_DE",
      name: ignoreSymbol ? '' : _symbol,
      symbol: ignoreSymbol ? "" : "$_symbol${spaceIcon ? " " : ""}",
      decimalDigits: (value is int ? decimalDigits : 2),
    );
    if (amount.isEmpty || amount == "null") {
      return "-";
    }
    amount = amount.replaceAll(RegExp(r'[^0-9\.]'), "");
    final amountDouble = double.tryParse(amount);
    if (amountDouble == null) {
      return amount;
    }
    return formatter.format(amountDouble);
  }

  @deprecated
  static String formatCurrencyLong(
    num? value, {
    bool spaceIcon = false,
    bool ignoreSymbol = false,
    String? symbol = '\$',
  }) {
    String amount = "${value ?? ''}";
    final formatter = NumberFormat.currency(
      locale: "en_US",
      name: ignoreSymbol ? '' : symbol ?? '\$',
      symbol: ignoreSymbol ? "" : "$symbol${spaceIcon ? " " : ""}",
      decimalDigits: 0,
    );
    if (amount.isEmpty || amount == "null") {
      return "${symbol}0";
    }
    amount = amount.replaceAll(RegExp(r'[^0-9\.]'), "");
    final amountDouble = double.tryParse(amount);
    if (amountDouble == null) {
      return amount;
    }
    return formatter.format(amountDouble);
  }

  static String formatXML(String xmlString) {
    String parsedString = xmlString.replaceAll(BakerRegex.xmlRegex, "");
    return parsedString.trim();
  }

  static String formatNumber(String? amount) {
    final formatter = NumberFormat.currency(
      locale: "en_NG",
      name: '',
      symbol: "",
      decimalDigits: 0,
    );
    amount = amount?.replaceAll(RegExp(r'[^0-9\.]'), "");
    final amountDouble = double.tryParse(amount ?? "");
    if (amount == null || amountDouble == null) {
      return "";
    }
    return formatter.format(amountDouble);
  }
}

class BakerAmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    try {
      if (oldValue == newValue) {
        return TextEditingValue(
          text: newValue.text,
          selection: TextSelection.collapsed(offset: newValue.text.length),
          composing: TextRange.empty,
        );
      }
      final amount = newValue.text.isNotEmpty
          ? newValue.text.replaceAll(RegExp(r'[^0-9\.]'), "")
          : "";
      final isValidNum = amount.isNotEmpty && int.tryParse(amount) != null;
      if (isValidNum) {
        final formattedText = BakerTextFormatter.formatNumber(amount);
        return TextEditingValue(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
          composing: TextRange.empty,
        );
      } else {
        return newValue;
      }
    } catch (e, t) {
      BakerLogger.severe("$e", stackTrace: t, error: e);
      return oldValue;
    }
  }
}
