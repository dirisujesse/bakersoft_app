import 'package:baker_app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:baker_app/data/constants/assets.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

class AppBackButton extends StatelessWidget {
  final Color? color;
  final OnPressed? action;
  final AlignmentGeometry alignment;
  final String iconPath;

  const AppBackButton({
    this.color = BakerColors.black,
    this.action,
    this.alignment = Alignment.centerLeft,
    this.iconPath = BakerSvgs.backIcon,
  });

  const AppBackButton.close({
    this.color,
    this.action,
    this.alignment = Alignment.centerRight,
    this.iconPath = BakerSvgs.close,
  });
  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    if (!Navigator.of(context).canPop()) return const Offstage();
    return InkWell(
      child: Padding(
        padding: scaler.insets.only(right: 1),
        child: BackButtonIcon(),
      ),
      onTap: () {
        if (action != null) {
          action!();
          return;
        }
        Navigator.of(context).pop();
      },
    );
  }
}
