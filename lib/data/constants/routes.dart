import 'package:baker_app/data/models/arguments/product_screen_arguments.dart';
import 'package:baker_app/presentation/screens/cart/cart_screen.dart';
import 'package:baker_app/presentation/screens/favourites/favourites_screen.dart';
import 'package:baker_app/presentation/screens/product/product_detail_screen.dart';
import 'package:baker_app/presentation/screens/product/products_screen.dart';
import 'package:flutter/material.dart'
    show BuildContext, MaterialPageRoute, Route, RouteSettings, Widget;
import 'package:baker_app/presentation/screens/splash_screen.dart';

class BakerRoutes {
  static const Widget home = const SplashScreen();

  /// SPLASH ROUTES
  static const splash = "/splash";

  /// PRODUCT ROUTES
  static const product = "/product";
  static const productDetail = "/product/detail";

  /// CART ROUTES
  static const cart = "/cart";

  /// FAVOURITES ROUTES
  static const favourites = "/favourites";

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    splash: (context) => home,
    product: (context) => const ProductListScreen(),
    cart: (context) => const CartScreen(),
    favourites: (context) => const FavouritesScreen(),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      case productDetail:
        return MaterialPageRoute(builder: (context) {
          return ProductDetailScreen(
            settings.arguments as ProductDetailScreenArguments,
          );
        });
      default:
        return MaterialPageRoute(builder: (context) => home);
    }
  }
}
