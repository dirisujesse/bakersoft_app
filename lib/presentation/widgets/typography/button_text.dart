import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/fragments/spacers/app_spacer.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';

class ButtonText extends StatelessWidget {
  final double fontSize;
  final Color? textColor;
  final Widget? icon;
  final Widget? trailingIcon;
  final FontWeight fontWeight;
  final String? text;
  final bool fitted;
  final TextDecoration decoration;

  ButtonText(
    this.text, {
    this.fontSize = BakerFontSizes.px16,
    this.textColor,
    this.icon,
    this.trailingIcon,
    this.fontWeight = FontWeight.w600,
    this.fitted = true,
    this.decoration = TextDecoration.none,
  });

  Widget _iconBtnChild(TextStyle? btnTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) icon!,
        if (icon != null) const BakerSizedBox(width: 2),
        _child(btnTheme),
        if (trailingIcon != null) const BakerSizedBox(width: 1),
        if (trailingIcon != null) trailingIcon!,
      ],
    );
  }

  Widget _child(TextStyle? btnTheme) {
    return BakerText(
      text ?? "Tap",
      textAlign: TextAlign.center,
      style: btnTheme?.copyWith(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        decoration: decoration
      ),
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final btnTheme = Theme.of(context).textTheme.button;
    final _descendant = (icon != null || trailingIcon != null)
        ? _iconBtnChild(btnTheme)
        : _child(btnTheme);
    return fitted ? FittedBox(child: _descendant) : _descendant;
  }
}
