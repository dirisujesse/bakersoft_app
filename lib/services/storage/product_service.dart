import 'package:baker_app/data/config/app_config.dart';
import 'package:baker_app/data/constants/json.dart';
import 'package:baker_app/data/models/podos/product.dart';
import 'package:baker_app/objectbox.g.dart';
import 'package:baker_app/services/logging/little_logger.dart';
import 'package:baker_app/services/storage/mixins/query_mixin.dart';

class ProductService with AppQueryMixin {
  static ProductService? _instance;

  static ProductService get instance {
    if (_instance == null) {
      _instance = ProductService();
    }
    return _instance!;
  }

  late final Box<Product> _box;

  ProductService() {
    _box = AppConfig.instance.store.box<Product>();
  }

  Future<bool> get hasProducts async {
    try {
      final count = await _box.count(limit: 8);
      return count > 0;
    } catch (e, t) {
      BakerLogger.severe("$e", error: e, stackTrace: t);
      return false;
    }
  }

  dumpProducts() async {
    try {
      if (await hasProducts) return;
      await _box.putMany(BakerJsonDump.products);
    } catch (e, t) {
      BakerLogger.severe("$e", error: e, stackTrace: t);
    }
  }

  Future<List<Product>> listProducts() async {
    return await queryHandler(() async {
      return await _box.getAll();
    });
  }

  Future<List<Product>> listFavourites() async {
    return await queryHandler(() async {
      final queryBuilder = _box.query(Product_.isFavourite.equals(true)).build();
      return await queryBuilder.find();
    });
  }

  Future<bool> toggleFavouriteState(Product product) async {
    return await queryHandler(() async {
      product.toggleFavouriteState();
      await _box.put(product, mode: PutMode.update);
      return true;
    });
  }
}
