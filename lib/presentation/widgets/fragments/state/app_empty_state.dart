import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/fragments/buttons/app_button.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/typedefs.dart';
import 'package:flutter/material.dart';

class AppEmptyState extends StatelessWidget {
  final String message;
  final Color messageColor;
  final OnPressed? onRetry;
  final String retryText;

  const AppEmptyState({
    required this.message,
    this.messageColor = BakerColors.black,
    this.onRetry,
    this.retryText = "Retry",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BakerText(
            message,
            style: BakerTextStyle.regular.copyWith(color: messageColor),
            textAlign: TextAlign.center,
          ),
          BakerButton.flat(text: retryText, onPressed: onRetry),
        ],
      ),
    );
  }
}
