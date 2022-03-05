import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:flutter/material.dart';

class AlertPill extends StatelessWidget {
  final String message;
  final Color? color;
  final Color? textColor;
  final bool isPadded;

  const AlertPill({
    required this.message,
    this.color,
    this.textColor,
    this.isPadded = false,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Container(
      decoration: BoxDecoration(
        color: color ?? BakerColors.white,
        boxShadow: [BakerShadows.alertShadow],
        borderRadius: BorderRadius.circular(
          scaler.fontSizer.sp(BakerFontSizes.px24),
        ),
      ),
      padding: scaler.insets.symmetric(horizontal: 5, vertical: .8),
      margin: isPadded ? scaler.insets.defaultHorizontalInsets : null,
      child: BakerText(
        message,
        style: BakerTextStyle.semiBold.copyWith(
          fontSize: BakerFontSizes.px14,
          color: textColor,
        ),
        maxLines: 10,
        textAlign: TextAlign.center,
      ),
    );
  }
}
