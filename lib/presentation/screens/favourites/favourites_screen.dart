import 'package:baker_app/presentation/screens/favourites/widgets/favourites_list.dart';
import 'package:baker_app/presentation/widgets/fragments/icons/cart_icon.dart';
import 'package:baker_app/presentation/widgets/layouts/app_bars/app_appbar.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BakerAppBar(
        title: "Favourites",
        action: const CartIcon(),
      ),
      body: FavouritesList(),
    );
  }
}
