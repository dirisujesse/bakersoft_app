import 'package:baker_app/data/models/podos/order.dart';
import 'package:baker_app/presentation/screens/product/widgets/product_image.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/styles/text_styles.dart';
import 'package:baker_app/presentation/widgets/fragments/state/app_empty_state.dart';
import 'package:baker_app/presentation/widgets/fragments/state/app_spinner.dart';
import 'package:baker_app/presentation/widgets/typography/app_text.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/lma_helper_functions.dart';
import 'package:baker_app/services/utilities/lma_text_formatter.dart';
import 'package:baker_app/state/cart/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartState>();
    final scaler = context.scaler;

    return ValueListenableBuilder<Future<List<ProductOrder>>?>(
      valueListenable: state.ordersRef,
      builder: (context, future, child) {
        return FutureBuilder<List<ProductOrder>>(
          builder: (context, task) {
            if (task.isLoading) return child!;
            if (task.hasError) {
              return AppEmptyState(
                message: BakerHelpers.parseError(
                  task.error,
                  defaultMessage: "Failed to fetch orders",
                ),
                messageColor: BakerColors.red,
                onRetry: state.refreshOrders,
              );
            }
            if (!task.hasData || (task.data?.isEmpty ?? true)) {
              return AppEmptyState(
                message: "You have no orders",
                onRetry: state.refreshOrders,
              );
            }
            final orders = task.data ?? [];

            return ListView.separated(
              itemBuilder: (context, index) {
                final order = orders[index];

                return CartListTile(order);
              },
              separatorBuilder: (context, _) {
                return Divider(height: scaler.sizer.setHeight(4));
              },
              padding: scaler.insets.symmetric(
                horizontal: 5,
                vertical: 2,
              ),
              itemCount: orders.length,
            );
          },
          future: future,
        );
      },
      child: const AppSpinner(),
    );
  }
}

class CartListTile extends StatelessWidget {
  final ProductOrder order;

  const CartListTile(this.order);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartState>();
    final scaler = context.scaler;
    final count = order.count;

    return Table(
      columnWidths: {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(.5),
        2: FlexColumnWidth(7),
        3: FlexColumnWidth(.5),
        4: FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            ProductImage(
              order.product,
              showFavIcon: false,
              height: scaler.sizer.setHeight(10),
            ),
            const Offstage(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BakerText(
                  "${count}x ${order.product.name}",
                  style: BakerTextStyle.header16,
                ),
                BakerText(
                  BakerTextFormatter.formatCurrency(order.value),
                  style: BakerTextStyle.regular.copyWith(
                    color: BakerColors.red,
                  ),
                ),
              ],
            ),
            const Offstage(),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  state.deleteOrder(order);
                },
                icon: Icon(
                  CupertinoIcons.delete,
                  color: BakerColors.red,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
