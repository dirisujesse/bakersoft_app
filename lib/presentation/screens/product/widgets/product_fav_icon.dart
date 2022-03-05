import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/services/utilities/lma_extensions.dart';
import 'package:baker_app/state/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductFavIcon extends StatelessWidget {
  final Product product;

  const ProductFavIcon(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductState>();
    final favIcon = Icon(
      Icons.favorite,
      color: BakerColors.red,
    );

    return IconButton(
      onPressed: () {
        state.toggleFavState(product);
      },
      icon: ValueListenableBuilder<Future<List<Product>>?>(
        valueListenable: state.favouritesRef,
        builder: (context, future, child) {
          return FutureBuilder<List<Product>>(
            builder: (context, task) {
              if (task.isLoading || task.hasError) {
                if (product.isFavourite) return favIcon;
                return child!;
              }
              final data = task.data ?? [];
              final isFavourite = data.any((it) => it.id == product.id);
              if (isFavourite) return favIcon;
              return child!;
            },
            future: future,
          );
        },
        child: Icon(
          Icons.favorite_border,
          color: BakerColors.grey,
        ),
      ),
    );
  }
}
