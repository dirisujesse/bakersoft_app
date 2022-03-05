import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/lma_text_formatter.dart';
import 'package:baker_app/services/utilities/typedefs.dart';
import 'package:flutter/material.dart';

class ProductDescriptionColumn extends StatelessWidget {
  final Product product;
  final int count;
  final OnChanged<int>? onChangeCount;

  const ProductDescriptionColumn(
      {required this.product, required this.count, this.onChangeCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BakerText(
          product.name,
          style: BakerTextStyle.header18,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BakerText(
              BakerTextFormatter.formatCurrency(product.price),
              style: BakerTextStyle.header18,
              maxLines: 1,
            ),
            if (onChangeCount != null)
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _ProductDescriptionCounter(
                    count: count,
                    onChangeCount: this.onChangeCount!,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _ProductDescriptionCounter extends StatelessWidget {
  final int count;
  final OnChanged<int> onChangeCount;

  const _ProductDescriptionCounter({
    required this.count,
    required this.onChangeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ProductCounterButton(onPressed: () {
          onChangeCount(1);
        }),
        Flexible(
          child: BakerText(
            "$count",
            style: BakerTextStyle.header16,
          ),
        ),
        _ProductCounterButton.decrement(onPressed: () {
          this.onChangeCount(-1);
        }),
      ],
    );
  }
}

class _ProductCounterButton extends StatelessWidget {
  final OnPressed onPressed;
  final bool _forIncrement;

  const _ProductCounterButton({required this.onPressed}) : _forIncrement = true;
  const _ProductCounterButton.decrement({required this.onPressed})
      : _forIncrement = false;

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: scaler.insets.all(2),
        margin: scaler.insets.only(
          right: _forIncrement ? 2 : 0,
          left: !_forIncrement ? 2 : 0,
        ),
        decoration: BoxDecoration(
          color: BakerColors.white,
          borderRadius: BorderRadius.circular(
            scaler.fontSizer.sp(BakerFontSizes.px4),
          ),
          boxShadow: [BakerShadows.cardActionShadow],
        ),
        alignment: Alignment.center,
        child: Center(
          child: Icon(
            _forIncrement ? Icons.add : Icons.remove,
            size: scaler.fontSizer.sp(BakerFontSizes.px14),
          ),
        ),
      ),
    );
  }
}
