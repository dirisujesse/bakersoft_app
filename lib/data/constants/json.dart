import 'package:baker_app/data/constants/assets.dart';
import 'package:baker_app/data/models/podos/product.dart';

class BakerJsonDump {
  static final List<Product> products = [
    Product(
      sku: "BKS-001-BEET_SOUP",
      name: "Beet Root Soup",
      decription: "An awesome tasting beetroot soup, best served warm",
      price: 30,
      imagePath: BakerImages.beetRoot,
      imageUrl: BakerNetworkImages.beetRoot,
    ),
    Product(
      sku: "BKS-002-BURGER",
      name: "Beef Burger",
      decription: "Yummy crispy beef burger just for you",
      price: 35,
      imagePath: BakerImages.burger,
      imageUrl: BakerNetworkImages.burger,
    ),
    Product(
      sku: "BKS-003-MILK_SHAKE",
      name: "Creamy Choco Shake",
      decription: "Chocolatey creamy milk shake for the coolest kids",
      price: 15,
      imagePath: BakerImages.milkShake,
      imageUrl: BakerNetworkImages.milkShake,
    ),
    Product(
      sku: "BKS-004-PANCAKE",
      name: "Honey Glazed Pancakes",
      decription: "Get your groove one with our honey glazed pancakes",
      price: 20,
      imagePath: BakerImages.pancake,
      imageUrl: BakerNetworkImages.pancake,
    ),
    Product(
      sku: "BKS-005-RAMEN",
      name: "Ramen Noodles",
      decription: "Special korean noodles",
      price: 32.5,
      imagePath: BakerImages.ramen,
      imageUrl: BakerNetworkImages.ramen,
    ),
    Product(
      sku: "BKS-006-SALMON",
      name: "Salmon Soup",
      decription: "Ooh lala, get on a culinary adventure with",
      price: 40,
      imagePath: BakerImages.salmonSoup,
      imageUrl: BakerNetworkImages.salmonSoup,
    ),
    Product(
      sku: "BKS-007-SANDWICH",
      name: "Royal Sandwich",
      decription: "Crispy, juicy, cruchy what more can we say",
      price: 22.3,
      imagePath: BakerImages.sandwich,
      imageUrl: BakerNetworkImages.sandwich,
    ),
    Product(
      sku: "BKS-008-SPAGH",
      name: "Spaghetti Bolognese",
      decription: "Nigerian made Italian delight",
      price: 50,
      imagePath: BakerImages.spaghetti,
      imageUrl: BakerNetworkImages.spaghetti,
    ),
  ];
}
