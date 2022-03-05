import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/services/storage/product_service.dart';
import 'package:flutter/material.dart';
import 'package:baker_app/state/state_interface.dart';

class ProductState extends ChangeNotifier implements StateContract {
  ValueNotifier<Future<List<Product>>?> _productsRef = ValueNotifier(null);
  ValueNotifier<Future<List<Product>>?> _favouritesRef = ValueNotifier(null);
  final service = ProductService.instance;
  static ProductState? _instance;

  @override
  reset() {
    _productsRef.value = null;
    _favouritesRef.value = null;
  }

  ProductState() {}

  ValueNotifier<Future<List<Product>>?> get productsRef {
    if (_productsRef.value == null) {
      _productsRef.value = service.listProducts();
    }
    return _productsRef;
  }

  ValueNotifier<Future<List<Product>>?> get favouritesRef {
    if (_favouritesRef.value == null) {
      _favouritesRef.value = service.listFavourites();
    }
    return _favouritesRef;
  }

  refreshProducts() {
    _productsRef.value = service.listProducts();
  }

  refreshFavourites() {
    _favouritesRef.value = service.listFavourites();
  }

  toggleFavState(Product product) async {
    await service.toggleFavouriteState(product);
    refreshFavourites();
  }

  static ProductState get instance {
    if (_instance == null) {
      _instance = ProductState();
    }
    return _instance!;
  }
}
