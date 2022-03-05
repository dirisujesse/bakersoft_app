import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/presentation/screens/product/widgets/product_card.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/widgets/fragments/state/app_empty_state.dart';
import 'package:baker_app/presentation/widgets/fragments/state/app_spinner.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/services/utilities/lma_helper_functions.dart';
import 'package:baker_app/state/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesList extends StatelessWidget {
  const FavouritesList();

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final state = context.watch<ProductState>();

    return ValueListenableBuilder<Future<List<Product>>?>(
      valueListenable: state.favouritesRef,
      builder: (context, future, child) {
        return FutureBuilder<List<Product>>(
          builder: (context, task) {
            if (task.isLoading) return child!;
            if (task.hasError) {
              return AppEmptyState(
                message: BakerHelpers.parseError(
                  task.error,
                  defaultMessage: "Favs could not be fetchd",
                ),
                messageColor: BakerColors.red,
                onRetry: state.refreshFavourites,
              );
            }
            if (!task.hasData || (task.data?.isEmpty ?? true)) {
              return AppEmptyState(
                message: "No favourites were found listed",
                onRetry: state.refreshFavourites,
              );
            }
            final data = task.data ?? [];
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: scaler.insets.symmetric(horizontal: 5, vertical: 2),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = data[index];
                        return ProductCard(
                          product,
                          key: Key(product.sku),
                        );
                      },
                      childCount: data.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: scaler.sizer.setWidth(2),
                      mainAxisSpacing: scaler.sizer.setHeight(2),
                      childAspectRatio: 2 / 2.6,
                    ),
                  ),
                )
              ],
            );
          },
          future: future,
        );
      },
      child: const AppSpinner(),
    );
  }
}
