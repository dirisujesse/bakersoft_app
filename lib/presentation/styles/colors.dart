import 'package:flutter/material.dart';

class BakerColors {
  static const MaterialColor primary = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color.fromRGBO(255, 255, 255, 0.1),
      100: const Color.fromRGBO(255, 255, 255, 0.2),
      200: const Color.fromRGBO(255, 255, 255, 0.3),
      300: const Color.fromRGBO(255, 255, 255, 0.4),
      400: const Color.fromRGBO(255, 255, 255, 0.5),
      500: const Color.fromRGBO(255, 255, 255, 0.6),
      600: const Color.fromRGBO(255, 255, 255, 0.7),
      700: const Color.fromRGBO(255, 255, 255, 0.8),
      800: const Color.fromRGBO(255, 255, 255, 0.9),
      900: const Color.fromRGBO(255, 255, 255, 1),
    },
  );

  static const MaterialColor secondary = const MaterialColor(
    0xFF051C3F,
    const <int, Color>{
      50: const Color.fromRGBO(77, 0, 0, 0.1),
      100: const Color.fromRGBO(77, 0, 0, 0.2),
      200: const Color.fromRGBO(77, 0, 0, 0.3),
      300: const Color.fromRGBO(77, 0, 0, 0.4),
      400: const Color.fromRGBO(77, 0, 0, 0.5),
      500: const Color.fromRGBO(77, 0, 0, 0.6),
      600: const Color.fromRGBO(77, 0, 0, 0.7),
      700: const Color.fromRGBO(77, 0, 0, 0.8),
      800: const Color.fromRGBO(77, 0, 0, 0.9),
      900: const Color.fromRGBO(77, 0, 0, 1),
    },
  );

  static const Color transparent = Color(0x00);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkerGrey = Color(0xFFA8A8A8);
  static const Color grey = Color(0xFFE8E8E8);
  static const Color background = Color(0xFFE5E5E5);
  static const Color diasabledButton = Color(0xFFCACACA);
  static const Color inputBorder = Color(0xFFD6D6D6);
  static const Color shadow = Color(0x40B7B7B7);
  static const Color helperText = Color(0xFF5B5B5B);
  static const Color text = Color(0xFF424242);
  static const Color red = Color(0xFF4D0000);
  static const Color black = Color(0xFF000000);
}

class BakerShadows {
  static const cardShadow = BoxShadow(
    color: BakerColors.shadow,
    spreadRadius: 8,
  );
  static const schoolLinkShadow = BoxShadow(
    color: Color.fromRGBO(143, 143, 143, .16),
    blurRadius: 32,
  );
  static const cardActionShadow = BoxShadow(
    color: Color.fromRGBO(183, 183, 183, 0.25),
    blurRadius: 8,
  );
  static const alertShadow = BoxShadow(
    color: Color.fromRGBO(158, 158, 158, 0.25),
    blurRadius: 24,
  );
}
