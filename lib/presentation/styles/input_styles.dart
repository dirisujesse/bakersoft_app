import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/colors.dart';

class BakerInputStyles {
  static final outlined = InputDecoration(
    errorMaxLines: 3,
    helperMaxLines: 3,
    isDense: true,
    filled: false,
    fillColor: BakerColors.transparent,
    suffixStyle: TextStyle(
      color: BakerColors.text,
    ),
    prefixStyle: TextStyle(
      color: BakerColors.text,
    ),
    labelStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w100,
    ),
    helperStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 12,
      fontWeight: FontWeight.w100,
    ),
    hintStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w100,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: BakerColors.inputBorder, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: BakerColors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: BakerColors.red,
        width: 1.2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: BakerColors.grey,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: BakerColors.darkerGrey, width: 1.2),
    ),
  );

  static final search = InputDecoration(
    errorMaxLines: 3,
    helperMaxLines: 3,
    isDense: true,
    filled: true,
    fillColor: Color(0XFFF0F0F0),
    suffixStyle: TextStyle(
      color: BakerColors.text,
    ),
    prefixStyle: TextStyle(
      color: BakerColors.text,
    ),
    labelStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w100,
    ),
    helperStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 12,
      fontWeight: FontWeight.w100,
    ),
    hintStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w100,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: Color(0XFFF0F0F0), width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: BakerColors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        color: BakerColors.red,
        width: 1.2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        color: BakerColors.grey,
        width: 0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: Color(0XFFF0F0F0), width: 1.2),
    ),
  );

  static final select = InputDecoration(
    errorMaxLines: 3,
    helperMaxLines: 3,
    isDense:false,
    filled: true,
    fillColor: BakerColors.white,
    suffixStyle: TextStyle(
      color: BakerColors.text,
    ),
    prefixStyle: TextStyle(
      color: BakerColors.text,
    ),
    labelStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w100,
    ),
    helperStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 12,
      fontWeight: FontWeight.w100,
    ),
    hintStyle: TextStyle(
      color: BakerColors.text,
      fontSize: 16,
      fontWeight: FontWeight.w100,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: BakerColors.grey, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: BakerColors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: BakerColors.red,
        width: 1.2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: BakerColors.grey,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: BakerColors.grey, width: 1.2),
    ),
  );
}
