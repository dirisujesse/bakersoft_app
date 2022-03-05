import 'package:baker_app/data/models/podos/dropdown_data.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/fragments/list_items/selection_tile.dart';
import 'package:baker_app/presentation/widgets/fragments/spacers/app_spacer.dart';
import 'package:baker_app/presentation/widgets/layouts/app_bars/app_appbar.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/typedefs.dart';
import 'package:flutter/material.dart';

class SelectionSheet<T> extends StatefulWidget {
  final SelectionData<T>? selection;
  final List<SelectionData<T>> options;
  final ScrollController controller;
  final String title;
  final OnChanged<SelectionData<T>> onSelect;

  const SelectionSheet({
    this.selection,
    required this.controller,
    required this.onSelect,
    required this.title,
    required this.options,
  });

  @override
  State<StatefulWidget> createState() => _SelectionSheetState<T>();
}

class _SelectionSheetState<T> extends State<SelectionSheet> {
  late final ValueNotifier<SelectionData?> _choiceOption;

  @override
  initState() {
    super.initState();
    _choiceOption = ValueNotifier(widget.selection);
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BakerSizedBox(height: 2),
          BakerAppBar(
            title: widget.title,
            style: BakerTextStyle.body1,
            implyLeading: false,
            titleAlignment: TextAlign.left,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: widget.controller,
              padding: scaler.insets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const BakerSizedBox(height: 3),
                  for (SelectionData option in widget.options)
                    ValueListenableBuilder<SelectionData?>(
                      valueListenable: _choiceOption,
                      builder: (_, val, __) {
                        return SelectionTile(
                          title: option.label,
                          onTap: () {
                            widget.onSelect(option);
                            Navigator.of(context).pop();
                          },
                          isSelected: option == widget.selection,
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
