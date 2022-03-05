import 'dart:math';

class BakerRandomizer {
  static Random _random = Random();

  static int randomInt(int range) {
    return _random.nextInt(range);
  }

  static int get integer => _random.nextInt(10000000);
  static double get float => _random.nextDouble();
  static bool get boolean => _random.nextBool();
}
