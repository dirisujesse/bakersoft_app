import 'package:flutter/widgets.dart' show TextStyle, FontWeight;
import 'package:baker_app/presentation/styles/colors.dart';

class BakerFonts {
  static const okta = "Okta";
}

class BakerFontSizes {
  static const px1 = 3.1;
  static const px2 = 6.25;
  static const px4 = 13.5;
  static const px6 = 20.3;
  static const px8 = 27.0;
  static const px10 = 34.0;
  static const px12 = 40.5;
  static const px14 = 47.2;
  static const px16 = 54.0;
  static const px18 = 60.9;
  static const px19 = 64.02;
  static const px20 = 67.5;
  static const px22 = 74.4;
  static const px24 = 81.0;
  static const px32 = 108.0;
  static const px36 = 122.0;
  static const px40 = 135.0;
  static const px48 = 162.0;
  static const px54 = 182.0;
  static const px56 = 189.0;
  static const px64 = 216.0;
  static const px82 = 276.4;
  static const px96 = 324.0;
  static const px164 = 552.7;
  static const px173 = 583.0;
  static const px180 = 606.6;
  static const px220 = 741.4;
}

class BakerTextStyle {
  static const TextStyle thin = TextStyle(
    fontFamily: BakerFonts.okta,
    fontWeight: FontWeight.w100,
  );

  static const TextStyle light = TextStyle(
    fontFamily: BakerFonts.okta,
    fontWeight: FontWeight.w200,
  );

  static const TextStyle normal = TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: BakerFonts.okta,
  );

  static const TextStyle regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: BakerFonts.okta,
  );

  static const TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: BakerFonts.okta,
  );

  static const TextStyle semiBold = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: BakerFonts.okta,
  );

  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: BakerFonts.okta,
  );

  static const TextStyle bolder = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: BakerFonts.okta,
  );

  static const TextStyle heavy = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: BakerFonts.okta,
  );

  static const TextStyle black = TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: BakerFonts.okta,
    color: BakerColors.black,
  );

  static final header24 = semiBold.copyWith(
    fontSize: BakerFontSizes.px24,
    // height: 1.48,
    color: BakerColors.black,
  );

  static final header20 = semiBold.copyWith(
    fontSize: BakerFontSizes.px20,
    // height: 1.48,
    color: BakerColors.black,
  );

  static final header16 = semiBold.copyWith(
    fontSize: BakerFontSizes.px16,
    // height: 1.4,
    color: BakerColors.black,
  );

  static final header14 = semiBold.copyWith(
    fontSize: BakerFontSizes.px14,
    // height: 1.4,
    color: BakerColors.black,
  );

  static final header18 = semiBold.copyWith(
    fontSize: BakerFontSizes.px18,
    // height: 1.4,
    color: BakerColors.black,
  );

  static final helper = regular.copyWith(fontSize: BakerFontSizes.px12);

  static final info = regular.copyWith(fontSize: BakerFontSizes.px14);

  static final body1 = regular.copyWith(fontSize: BakerFontSizes.px16);

  static final body2 = regular.copyWith(fontSize: BakerFontSizes.px18);
}
