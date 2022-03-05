import 'package:baker_app/data/constants/routes.dart';
import 'package:baker_app/data/models/podos/order.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/state/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartState>();
    final scaler = context.scaler;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(BakerRoutes.cart);
      },
      child: ValueListenableBuilder<Future<List<ProductOrder>>?>(
        valueListenable: state.ordersRef,
        builder: (context, future, child) {
          return FutureBuilder<List<ProductOrder>>(
            builder: (context, task) {
              final orders = (task.data ?? []).length;
              if (orders <= 0) return child!;
              return ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: scaler.sizer.setHeight(4),
                  height: scaler.sizer.setHeight(4),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                    Positioned(
                      child: CartCountBadge(orders),
                      top: -scaler.sizer.setHeight(.6),
                      right: 0,
                    )
                  ],
                ),
              );
            },
            future: future,
          );
        },
        child: Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }
}

class CartCountBadge extends StatelessWidget {
  final int count;

  const CartCountBadge(this.count, {Key? key}) : super(key: key);

  String get _count {
    if (count >= 10) return "9+";
    return "$count";
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Container(
      decoration: BoxDecoration(
        color: BakerColors.red,
        shape: BoxShape.circle,
      ),
      padding: scaler.insets.all(1.2),
      child: Center(
        child: BakerText(
          _count,
          style: BakerTextStyle.helper.copyWith(color: BakerColors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
