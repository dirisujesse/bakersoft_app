import 'dart:async';

import 'package:baker_app/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  static Future<Store> initDataStore() async {
    final appDir = await getApplicationDocumentsDirectory();
    return Store(getObjectBoxModel(), directory: "${appDir.path}/objectbox");
  }
}
