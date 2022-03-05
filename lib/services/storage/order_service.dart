import 'package:baker_app/data/config/app_config.dart';
import 'package:baker_app/data/models/podos/order.dart';
import 'package:baker_app/objectbox.g.dart';
import 'package:baker_app/services/logging/little_logger.dart';
import 'package:baker_app/services/storage/mixins/query_mixin.dart';

class OrderService with AppQueryMixin {
  static OrderService? _instance;

  static OrderService get instance {
    if (_instance == null) {
      _instance = OrderService();
    }
    return _instance!;
  }

  late final Box<ProductOrder> _box;

  OrderService() {
    _box = AppConfig.instance.store.box<ProductOrder>();
  }

  Future<bool> get hasOrders async {
    try {
      final count = await _box.count(limit: 8);
      return count > 0;
    } catch (e, t) {
      BakerLogger.severe("$e", error: e, stackTrace: t);
      return false;
    }
  }

  Future<List<ProductOrder>> listOrders() async {
    return await queryHandler(() async {
      return await _box.getAll();
    });
  }

  Future<bool> increaseOrderCount(ProductOrder order) async {
    return await queryHandler(() async {
      order.increaseCount();
      await _box.put(order, mode: PutMode.update);
      return true;
    });
  }

  Future<bool> decreaseOrderCount(ProductOrder order) async {
    return await queryHandler(() async {
      order.decreaseCount();
      await _box.put(order, mode: PutMode.update);
      return true;
    });
  }

  Future<bool> createOrder(ProductOrder order) async {
    return await queryHandler(() async {
      await _box.put(order);
      return true;
    });
  }

  Future<bool> remove(ProductOrder order) async {
    return await queryHandler(() async {
      await _box.remove(order.id);
      return true;
    });
  }

  Future<bool> clear() async {
    return await queryHandler(() async {
      await _box.removeAll();
      return true;
    });
  }
}
