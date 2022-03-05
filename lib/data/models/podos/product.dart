import 'package:objectbox/objectbox.dart';

@Entity()
class Product {
  int id = 0;
  @Index()
  final String sku;
  final String name;
  final List<String> options;
  final String decription;
  final String imageUrl;
  final String imagePath;
  final double price;
  bool isFavourite;

  Product({
    required this.sku,
    required this.name,
    required this.decription,
    required this.price,
    required this.imagePath,
    required this.imageUrl,
    this.options = const ['Small', 'Medium', 'Large'],
  }) : isFavourite = false;

  bool operator ==(other) {
    return other is Product && other.sku == sku && other.price == price;
  }

  toggleFavouriteState() {
    isFavourite = !isFavourite;
  }
}
