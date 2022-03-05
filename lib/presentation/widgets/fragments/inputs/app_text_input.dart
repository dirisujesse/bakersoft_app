import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:baker_app/data/constants/strings.dart';
import 'package:baker_app/data/models/podos/focus_state.dart';
import 'package:baker_app/data/models/podos/prefix_style.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/fragments/spacers/app_spacer.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/lma_scaler.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

class BakerTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isEnabled;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextCapitalization? textCapitalization;
  final String label;
  final bool obscureText;
  final bool autoFocus;
  final String? helperText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final PrefixStyle? prefixStyle;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final OnValidate<String?>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final OnChanged<String?>? onChanged;
  final OnPressed? onPrefixTap;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? semanticsLabel;
  final AutovalidateMode? autovalidateMode;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const BakerTextField({
    Key? key,
    this.focusNode,
    this.semanticsLabel,
    this.decoration,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization,
    this.controller,
    this.isEnabled = true,
    this.autoFocus = false,
    this.inputFormatters,
    this.prefixIcon,
    this.labelStyle,
    required this.label,
    this.prefixStyle,
    this.helperText,
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onPrefixTap,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixText,
    this.prefixTextStyle,
    this.validator,
    this.keyboardType,
    this.style,
    this.contentPaddingHorizontal = 4,
    this.contentPaddingVertical = 1.6,
    this.autovalidateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  const BakerTextField.multiline({
    Key? key,
    this.focusNode,
    this.semanticsLabel,
    this.decoration,
    this.textInputAction = TextInputAction.newline,
    this.textCapitalization,
    this.controller,
    this.isEnabled = true,
    this.autoFocus = false,
    this.inputFormatters,
    required this.label,
    this.prefixIcon,
    this.labelStyle,
    this.prefixStyle,
    this.prefixText,
    this.prefixTextStyle,
    this.onPrefixTap,
    this.helperText,
    this.textAlign = TextAlign.left,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.style,
    this.contentPaddingHorizontal = 4,
    this.contentPaddingVertical = 1.6,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.maxLines,
  })  : keyboardType = TextInputType.multiline,
        super(key: key);

  @override
  _BakerTextFieldState createState() => _BakerTextFieldState();
}

class _BakerTextFieldState extends State<BakerTextField>
    with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus = ValueNotifier(FocusState());
  late BakerScaleUtil scaler;

  _BakerTextFieldState();

  @override
  void initState() {
    super.initState();
    scaler = context.scaler;
    (widget.focusNode ?? _inputFocus).addListener(
      () {
        _hasFocus.value = FocusState(
          hasText: widget.ctrl.text.isNotEmpty,
          isFocused: widget.focusNode?.hasFocus ?? _inputFocus.hasFocus,
        );
      },
    );
  }

  @override
  dispose() {
    super.dispose();
  }

  InputDecoration get decoration {
    return widget.decoration ?? InputDecoration();
  }

  Color _borderColor({bool isForPrefix = false}) {
    if (_hasFocus.value.hasError ?? false) {
      return BakerColors.red;
    }
    if (_hasFocus.value.isFocused ?? false) {
      return BakerColors.red;
    }
    return isForPrefix ? BakerColors.inputBorder : BakerColors.text;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel ?? "Input Field",
      child: ValueListenableBuilder(
        valueListenable: _hasFocus,
        builder: (context, FocusState value, child) {
          if (widget.prefix == null) return child!;
          return Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  padding: widget.prefixStyle?.padding ??
                      scaler.insets.symmetric(
                        horizontal: 1,
                        vertical: .85,
                      ),
                  margin: widget.prefixStyle?.margin,
                  child: widget.prefix,
                  decoration: widget.prefixStyle?.decoration ??
                      BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: _borderColor(isForPrefix: true),
                            width: (value.isFocused ?? false) ? 1.2 : 1,
                          ),
                        ),
                      ),
                ),
                onTap: () {
                  if (widget.onPrefixTap != null) {
                    context.resetFocus();
                    widget.onPrefixTap!();
                  }
                },
              ),
              const BakerSizedBox(width: 1.5),
              Expanded(child: child!),
            ],
          );
        },
        child: TextFormField(
          obscuringCharacter: BakerStrings.mediumDot,
          autofocus: widget.autoFocus,
          autovalidateMode: widget.autovalidateMode,
          textDirection: TextDirection.ltr,
          showCursor: true,
          textAlign: widget.textAlign ?? TextAlign.left,
          focusNode: widget.focusNode ?? _inputFocus,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          style: widget.style ??
              BakerTextStyle.medium.copyWith(
                fontSize: scaler.fontSizer.sp(BakerFontSizes.px16),
                color: BakerColors.black,
              ),
          maxLength: widget.maxLength,
          controller: widget.ctrl,
          enabled: widget.isEnabled,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          decoration: decoration.copyWith(
            alignLabelWithHint: true,
            labelStyle: widget.labelStyle ??
                BakerTextStyle.body1.copyWith(
                  fontSize: scaler.fontSizer.sp(BakerFontSizes.px16),
                  color: BakerColors.text,
                ),
            helperStyle: BakerTextStyle.helper.copyWith(
              fontSize: scaler.fontSizer.sp(BakerFontSizes.px12),
              color: BakerColors.text,
            ),
            errorStyle: BakerTextStyle.helper.copyWith(
              fontSize: scaler.fontSizer.sp(BakerFontSizes.px12),
              color: BakerColors.red,
            ),
            counterText: "",
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            prefixText: widget.prefixText,
            counter: null,
            labelText: widget.label,
            helperText: widget.helperText,
            prefixStyle: widget.prefixTextStyle ??
                BakerTextStyle.body1.copyWith(
                  fontSize: scaler.fontSizer.sp(BakerFontSizes.px16),
                  color: BakerColors.text,
                ),
            prefixIconConstraints: BoxConstraints.tightForFinite(),
            contentPadding: scaler.insets.symmetric(
              horizontal: widget.contentPaddingHorizontal,
              vertical: widget.contentPaddingVertical,
            ),
          ),
          validator: (String? text) {
            if (widget.validator != null) {
              final error = widget.validator!(text);
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                _hasFocus.value = FocusState(
                  hasError: error != null,
                  hasText: _hasFocus.value.hasText ?? false,
                  isFocused: _hasFocus.value.isFocused ?? false,
                );
              });
              return error;
            }
            _hasFocus.value = FocusState(
              hasError: false,
              hasText: _hasFocus.value.hasText ?? false,
              isFocused: _hasFocus.value.isFocused ?? false,
            );
            return null;
          },
        ),
      ),
    );
  }
}
