import 'package:baker_app/services/storage/product_service.dart';
import 'package:baker_app/state/cart/cart_state.dart';
import 'package:baker_app/state/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:baker_app/state/splash/splash_state.dart';
import 'package:provider/provider.dart';

class StateWrapper extends StatelessWidget {
  final Widget child;

  StateWrapper({required this.child}) {
    ProductService.instance.dumpProducts();
  }

  static reset({bool ignoreDashState = false}) {
    SplashState.instance.reset();
    CartState.instance.reset();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashState.instance,
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => CartState.instance,
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductState.instance,
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}
