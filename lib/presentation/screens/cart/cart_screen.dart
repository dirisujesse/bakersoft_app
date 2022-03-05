import 'package:baker_app/presentation/screens/cart/widget/cart_list.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/layouts/app_bars/app_appbar.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/state/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartState>();

    return Scaffold(
      appBar: BakerAppBar(
        title: "Cart",
        action: InkWell(
          child: BakerText(
            "Clear all",
            style: BakerTextStyle.helper,
          ),
          onTap: state.clear,
        ),
      ),
      body: const CartList(),
    );
  }
}
