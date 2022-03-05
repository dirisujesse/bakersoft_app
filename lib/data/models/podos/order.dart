import 'package:baker_app/data/constants/assets.dart';
import 'package:baker_app/data/models/podos/product.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ProductOrder {
  int id = 0;
  Product? item;
  int count;

  final productRef = ToOne<Product>();

  ProductOrder({this.item, this.count = 1}) {
    productRef.target = item;
  }

  Product get product =>
      item ??
      productRef.target ??
      Product(
        sku: "",
        name: "",
        decription: "",
        price: 0,
        imagePath: BakerImages.logo,
        imageUrl: BakerNetworkImages.beetRoot,
      );

  set product(Product? product) {
    item = product;
    productRef.target = product;
  }

  increaseCount() {
    if (count >= 10) return;
    count += 1;
  }

  decreaseCount() {
    if (count <= 1) return;
    count -= 1;
  }

  num get value => product.price * count;
}
