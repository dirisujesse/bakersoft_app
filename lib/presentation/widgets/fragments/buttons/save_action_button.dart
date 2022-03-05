import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

class SaveActionButton extends StatelessWidget {
  final OnPressed? onPressed;

  const SaveActionButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: BakerText(
        "Save",
        style: BakerTextStyle.header16.copyWith(
          color: BakerColors.red,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
