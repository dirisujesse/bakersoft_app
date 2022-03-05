import 'package:baker_app/presentation/styles/input_styles.dart';
import 'package:flutter/material.dart';
import 'package:baker_app/data/models/podos/dropdown_data.dart';
import 'package:baker_app/data/models/podos/focus_state.dart';
import 'package:baker_app/presentation/widgets/fragments/inputs/app_text_input.dart';
import 'package:baker_app/services/utilities/lma_modals.dart';
import 'package:baker_app/services/utilities/src.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

class BakerDropDownField<T> extends StatefulWidget {
  final TextEditingController? controller;
  final bool isEnabled;
  final InputDecoration? decoration;
  final String label;
  final Widget? prefix;
  final OnValidate<String?>? validator;
  final OnChanged<String?>? onChanged;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? semanticsLabel;
  final List<SelectionData<T>> options;
  final ValueNotifier<SelectionData<T>?>? selection;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const BakerDropDownField({
    Key? key,
    this.semanticsLabel,
    this.decoration,
    this.controller,
    this.isEnabled = true,
    required this.label,
    this.textAlign = TextAlign.left,
    this.onChanged,
    this.prefix,
    this.validator,
    this.style,
    required this.options,
  })  : selection = null,
        super(key: key);

  const BakerDropDownField.withSelection({
    Key? key,
    this.semanticsLabel,
    this.decoration,
    this.selection,
    this.isEnabled = true,
    required this.label,
    this.textAlign = TextAlign.left,
    this.onChanged,
    this.prefix,
    this.validator,
    this.style,
    required this.options,
  })  : controller = null,
        super(key: key);

  @override
  _BakerDropDownTextFieldState createState() =>
      _BakerDropDownTextFieldState();
}

class _BakerDropDownTextFieldState extends State<BakerDropDownField>
    with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus = ValueNotifier(FocusState());
  late final ValueNotifier<SelectionData?> _selectionRef;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _selectionRef = widget.selection ?? ValueNotifier(null);
    _controller = widget.controller ??
        TextEditingController(text: _selectionRef.value?.label);
    _inputFocus.addListener(
      () {
        _hasFocus.value = FocusState(
          hasText: widget.ctrl.text.isNotEmpty,
          isFocused: _inputFocus.hasFocus,
        );
      },
    );
  }

  InputDecoration get decoration {
    return widget.decoration ?? InputDecoration();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel ?? "Input Field",
      child: ValueListenableBuilder<SelectionData?>(
        builder: (_, activeOption, __) {
          return InkWell(
            onTap: () {
              context.resetFocus();
              showSelectionSheet(
                context,
                options: widget.options,
                title: widget.label,
                onSelect: (choice) {
                  if (widget.selection != null) {
                    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                      _selectionRef.value = choice;
                    });
                  }
                  _controller.text = choice.label;
                },
                selection: activeOption,
              );
            },
            child: IgnorePointer(
              child: BakerTextField(
                decoration: widget.decoration ?? BakerInputStyles.select,
                controller: _controller,
                label: widget.label,
                prefix: widget.prefix,
                isEnabled: widget.isEnabled,
                validator: widget.validator,
                textAlign: widget.textAlign,
                style: widget.style,
                onChanged: widget.onChanged,
                suffixIcon: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
        valueListenable: _selectionRef,
      ),
    );
  }
}
