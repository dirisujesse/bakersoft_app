import 'package:baker_app/data/constants/assets.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/fragments/spacers/app_spacer.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/src.dart';
import 'package:baker_app/services/utilities/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final OnPressed? onTap;
  final double verticalPadding;

  const SelectionTile({
    Key? key,
    required this.title,
    this.isSelected = false,
    this.onTap,
    this.verticalPadding = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return InkWell(
      child: Padding(
        padding: scaler.insets.symmetric(vertical: verticalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BakerText(
                title,
                style: BakerTextStyle.medium,
              ),
            ),
            BakerSizedBox(width: 1),
            SvgPicture.asset(
              !isSelected ? BakerSvgs.inactiveRadio : BakerSvgs.activeRadio,
              height: scaler.fontSizer.sp(90),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
