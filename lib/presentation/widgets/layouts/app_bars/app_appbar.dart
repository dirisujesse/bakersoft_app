import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/fragments/buttons/app_back_button.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

class BakerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final Widget? action;
  final TextStyle? style;
  final Color? backgroundColor;
  final Color? leadingColor;
  final Brightness? brightness;
  final bool implyLeading;
  final bool isPadded;
  final OnPressed? onPop;
  final TextAlign titleAlignment;

  const BakerAppBar({
    Key? key,
    this.title,
    this.implyLeading = true,
    this.titleAlignment = TextAlign.center,
    this.action,
    this.leading,
    this.backgroundColor = BakerColors.white,
    this.leadingColor,
    this.brightness,
    this.style,
    this.onPop,
    this.isPadded = true,
  })  : titleWidget = null,
        super(key: key);

  const BakerAppBar.withTitleWidget({
    Key? key,
    this.titleWidget,
    this.implyLeading = true,
    this.titleAlignment = TextAlign.center,
    this.action,
    this.leading,
    this.backgroundColor = BakerColors.white,
    this.leadingColor,
    this.brightness,
    this.style,
    this.onPop,
    this.isPadded = true,
  })  : title = null,
        super(key: key);

  Widget? get _leading {
    if (leading != null) return leading!;
    if (implyLeading) {
      return AppBackButton(color: leadingColor, action: onPop);
    }
    return null;
  }

  Widget? get _trailing {
    return action ?? const Offstage();
  }

  TextStyle get _style {
    return style ?? BakerTextStyle.header16;
  }

  bool get _lacksEdges {
    return !_hasLeading && !_hasTrailing;
  }

  bool get _hasLeading => _leading != null;
  bool get _hasTrailing => action != null;

  Map<int, FlexColumnWidth>? get _columnWidths {
    if (_lacksEdges) return null;
    if (!_hasLeading) {
      return {
        0: FlexColumnWidth(8),
        1: FlexColumnWidth(.1),
        2: FlexColumnWidth(3),
      };
    }
    return {
      0: FlexColumnWidth(3),
      1: FlexColumnWidth(.1),
      2: FlexColumnWidth(5),
      3: FlexColumnWidth(.1),
      4: FlexColumnWidth(3),
    };
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Container(
      padding: scaler.insets.symmetric(
        vertical: 2,
        horizontal: isPadded ? 5 : 0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: BakerColors.grey,
            width: 2,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: _columnWidths,
          children: [
            TableRow(children: [
              if (_hasLeading)
                Align(
                  alignment: Alignment.centerLeft,
                  child: _leading,
                ),
              if (_hasLeading) const Offstage(),
              titleWidget ??
                  BakerText(
                    title,
                    style: _style,
                    textAlign: titleAlignment,
                  ),
              if (!_lacksEdges) const Offstage(),
              if (!_lacksEdges)
                Align(
                  alignment: Alignment.centerRight,
                  child: _trailing,
                ),
            ])
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size(double.infinity, 80);
  }
}
