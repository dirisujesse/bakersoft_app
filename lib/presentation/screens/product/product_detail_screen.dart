import 'package:baker_app/data/models/arguments/product_screen_arguments.dart';
import 'package:baker_app/data/models/podos/dropdown_data.dart';
import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/presentation/screens/product/widgets/product_description_column.dart';
import 'package:baker_app/presentation/screens/product/widgets/product_image.dart';
import 'package:baker_app/presentation/widgets/fragments/buttons/app_button.dart';
import 'package:baker_app/presentation/widgets/fragments/icons/cart_icon.dart';
import 'package:baker_app/presentation/widgets/fragments/inputs/app_dropdown_text_field.dart';
import 'package:baker_app/presentation/widgets/fragments/spacers/app_spacer.dart';
import 'package:baker_app/presentation/widgets/layouts/app_bars/app_appbar.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/lma_overlays.dart';
import 'package:baker_app/state/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetailScreenArguments arguments;

  const ProductDetailScreen(this.arguments);

  @override
  State<StatefulWidget> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late final ValueNotifier<int> _orderCountRef;
  late final TextEditingController _optionCtrl;

  @override
  initState() {
    super.initState();
    _orderCountRef = ValueNotifier(1);
    _optionCtrl = TextEditingController();
  }

  Product get product => widget.arguments.product;

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final state = context.watch<CartState>();
    final overlay = BakerAlertOverlay.of(context);

    return Scaffold(
      appBar: BakerAppBar(
        title: product.name,
        action: const CartIcon(),
      ),
      bottomNavigationBar: Padding(
        padding: scaler.insets.fromLTRB(5, .5, 5, 2),
        child: BakerButton(
          text: "Add to cart",
          onPressed: () async {
            await state.createOrder(
              product: product,
              count: _orderCountRef.value,
            );
            overlay.show(message: "Order Created");
            Navigator.of(context).pop();
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: scaler.sizer.setHeight(42),
            flexibleSpace: FlexibleSpaceBar(
              background: ProductImage(product),
            ),
          ),
          SliverPadding(
            padding: scaler.insets.symmetric(horizontal: 5, vertical: 2),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ValueListenableBuilder<int>(
                    valueListenable: _orderCountRef,
                    builder: (context, count, _) {
                      return ProductDescriptionColumn(
                        product: product,
                        count: count,
                        onChangeCount: (_count) {
                          final newCount = count + _count;
                          if (newCount <= 0 || newCount > 10) {
                            overlay.show(message: "Limit reached");
                            return;
                          }
                          _orderCountRef.value = newCount;
                        },
                      );
                    },
                  ),
                  Divider(
                    height: scaler.sizer.setHeight(4),
                  ),
                  BakerText(product.decription),
                  const BakerSizedBox(height: 6),
                  BakerDropDownField(
                    label: "Select Options",
                    controller: _optionCtrl,
                    options: [
                      for (final option in product.options)
                        SelectionData(selection: option, label: option),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
