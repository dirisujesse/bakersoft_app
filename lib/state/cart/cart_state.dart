import 'package:baker_app/data/models/podos/order.dart';
import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/services/storage/order_service.dart';
import 'package:flutter/material.dart';
import 'package:baker_app/state/state_interface.dart';

class CartState extends ChangeNotifier implements StateContract {
  ValueNotifier<Future<List<ProductOrder>>?> _ordersRef = ValueNotifier(null);
  final service = OrderService.instance;
  static CartState? _instance;

  @override
  reset() {
    _ordersRef.value = null;
  }

  static CartState get instance {
    if (_instance == null) {
      _instance = CartState();
    }
    return _instance!;
  }

  ValueNotifier<Future<List<ProductOrder>>?> get ordersRef {
    if (_ordersRef.value == null) {
      _ordersRef.value = service.listOrders();
    }
    return _ordersRef;
  }

  refreshOrders() {
    _ordersRef.value = service.listOrders();
  }

  createOrder({required Product product, int count = 0}) async {
    await service.createOrder(
      ProductOrder(item: product, count: count),
    );
    refreshOrders();
  }

  deleteOrder(ProductOrder order) async {
    await service.remove(order);
    refreshOrders();
  }

  clear() async {
    await service.clear();
    refreshOrders();
  }
}
