import 'package:baker_app/data/constants/routes.dart';
import 'package:baker_app/presentation/screens/product/widgets/product_list.dart';
import 'package:baker_app/presentation/styles/colors.dart';
import 'package:baker_app/presentation/widgets/fragments/icons/cart_icon.dart';
import 'package:baker_app/presentation/widgets/layouts/app_bars/app_appbar.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(BakerRoutes.favourites);
        },
        child: Icon(
          Icons.favorite,
          color: BakerColors.white,
        ),
      ),
      appBar: BakerAppBar(
        title: "Product Catalogue",
        action: const CartIcon(),
      ),
      body: ProductList(),
    );
  }
}
