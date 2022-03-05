import 'package:flutter/material.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';

class BakerText extends StatelessWidget {
  final String? data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final bool? softWrap;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final bool _isEditable;

  const BakerText(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    Key? key,
  })  : _isEditable = false,
        super(key: key);

  const BakerText.editable(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
  }) : _isEditable = true;

  @override
  Widget build(BuildContext context) {
    final _defualtSize = BakerFontSizes.px16;
    final _style = style != null ? style : BakerTextStyle.regular;
    final _fontSize =
        style != null ? _style?.fontSize ?? _defualtSize : _defualtSize;
    final fontSizer = context.scaler.fontSizer;

    if (_isEditable) {
      return EditableText(
        toolbarOptions: ToolbarOptions(
          copy: true,
        ),
        readOnly: true,
        controller: TextEditingController(
          text: data,
        ),
        focusNode: FocusNode(),
        style: _style!.copyWith(fontSize: fontSizer.sp(_fontSize)),
        cursorColor: BakerColors.red,
        backgroundCursorColor: BakerColors.transparent,
        strutStyle: strutStyle,
        textAlign: textAlign ?? TextAlign.start,
        locale: locale,
        maxLines: maxLines,
        textDirection: textDirection,
        textWidthBasis: TextWidthBasis.parent,
      );
    }

    return Text(
      data ?? "",
      style: _style?.copyWith(fontSize: fontSizer.sp(_fontSize)),
      strutStyle: strutStyle,
      textAlign: textAlign,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
