import 'package:get_storage/get_storage.dart';

import 'storage_keys.dart';

final box = GetStorage();

class LocalStorage {
  static void save(String key, String value) {
    box.write(key, value);
  }

  static void clear(String key) {
    box.remove(key);
  }

  static String? get(String key) {
    var value = box.read(key);
    return value;
  }

  static void clearAll() {
    box.remove(Keys.userId);
    box.remove(Keys.userRole);
    box.remove(Keys.fcmToken);
    box.remove(Keys.deviceId);
  }
}
