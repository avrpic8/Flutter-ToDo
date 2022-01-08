import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/app/core/util/constants.dart';
import 'package:to_do/app/data/models/settings.dart';

class StorageService extends GetxService {
  late GetStorage _box;

  Future<StorageService> init() async {
    _box = GetStorage();
    //await _box.write(taskKey, []);
    await _box.writeIfNull(taskKey, []);
    await _box.writeIfNull(
      appSettingsKey,
      jsonEncode(
        AppSettings(isDark: false, lan: "en", requirePass: false, splash: true),
      ),
    );
    await _box.writeIfNull('permission', true);
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  void clearAllTodos(String key) {
    _box.remove(key);
  }
}
