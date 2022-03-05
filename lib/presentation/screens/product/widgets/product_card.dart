import 'package:baker_app/data/constants/routes.dart';
import 'package:baker_app/data/models/arguments/product_screen_arguments.dart';
import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/presentation/screens/product/widgets/product_image.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/lma_text_formatter.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final borderRadius = BorderRadius.circular(
      scaler.fontSizer.sp(BakerFontSizes.px12),
    );

    return GestureDetector(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          decoration: BoxDecoration(
            color: BakerColors.white,
            border: Border.all(color: BakerColors.grey),
            borderRadius: borderRadius,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: ProductImage(product)),
              Container(
                padding: scaler.insets.symmetric(horizontal: 3, vertical: 1.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BakerText(
                      product.name,
                      style: BakerTextStyle.header14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    BakerText(
                      BakerTextFormatter.formatCurrency(product.price),
                      style: BakerTextStyle.header14,
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          BakerRoutes.productDetail,
          arguments: ProductDetailScreenArguments(product: product),
        );
      },
    );
  }
}
