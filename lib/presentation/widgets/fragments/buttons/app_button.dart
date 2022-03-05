import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/typography/button_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

class BakerButton extends StatelessWidget {
  final OnPressed? onPressed;
  final Color color;
  final Color? borderColor;
  final Widget? icon;
  final Color disabledColor;
  final Color textColor;
  final String text;
  // final bool isDense;
  final bool isFitted;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final double cornerRadius;
  final Widget? trailingIcon;
  final TextDecoration? decoration;

  BakerButton({
    required this.text,
    required this.onPressed,
    this.borderColor,
    this.icon,
    this.color = BakerColors.red,
    this.textColor = BakerColors.white,
    this.disabledColor = BakerColors.diasabledButton,
    this.isFitted = true,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontWeight = FontWeight.w600,
    this.fontSize = BakerFontSizes.px16,
    this.cornerRadius = BakerFontSizes.px8,
    this.trailingIcon,
    Key? key,
  })  : decoration = null,
        super(key: key);

  BakerButton.flat({
    required this.text,
    required this.onPressed,
    this.borderColor,
    this.icon,
    this.color = BakerColors.transparent,
    this.textColor = BakerColors.red,
    this.disabledColor = BakerColors.diasabledButton,
    this.isFitted = true,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontWeight = FontWeight.w600,
    this.fontSize = BakerFontSizes.px16,
    this.cornerRadius = BakerFontSizes.px8,
    this.trailingIcon,
    Key? key,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          onPressed == null ? disabledColor : color,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              scaler.fontSizer.sp(cornerRadius),
            ),
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor!,
                    width: 1,
                  ),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          scaler.insets.symmetric(
            vertical: verticalPadding ?? 1.6,
            horizontal: horizontalPadding ?? 6,
          ),
        ),
      ),
      child: ButtonText(
        text,
        textColor: onPressed != null ? textColor : BakerColors.white,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fitted: isFitted,
        icon: icon,
        trailingIcon: trailingIcon,
        decoration: decoration ?? TextDecoration.none,
      ),
      onPressed: onPressed != null
          ? () {
              context.resetFocus();
              onPressed!();
            }
          : null,
    );
  }
}
