import 'package:baker_app/presentation/widgets/fragments/modals/app_modal.dart';
import 'package:baker_app/presentation/widgets/layouts/sheets/app_selection_sheet.dart';
import 'package:flutter/material.dart';
import 'package:baker_app/data/models/podos/dropdown_data.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/services/utilities/typedefs.dart';

showSelectionSheet<T>(
  BuildContext context, {
  required List<SelectionData<T>> options,
  required String title,
  required OnChanged<SelectionData<T>> onSelect,
  SelectionData<T>? selection,
}) async {
  final length = options.length;
  final size = length >= 8 ? 8 : length;
  final fraction = size / 10;
  final computedFraction = fraction <= .35 ? .35 : .8;
  
  BakerBottomModal.draggable(
    ctx: context,
    isPadded: false,
    initialChildSize: computedFraction,
    minChildSize: .05,
    maxChildSize: .8,
    borderRadius: BakerFontSizes.px8,
    builder: (_) {
      return SelectionSheet(
        controller: _,
        onSelect: onSelect,
        title: title,
        options: options,
        selection: selection,
      );
    },
  );
}
