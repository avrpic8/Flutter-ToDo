import 'dart:convert';

import 'package:get/get.dart';
import 'package:to_do/app/data/models/settings.dart';
import 'package:to_do/app/data/services/storage/services.dart';

class SettingsProvider {
  final _storage = Get.find<StorageService>();

  AppSettings readAppSettings() {
    var json = _storage.read('settings').toString();
    Map<String, dynamic> map = jsonDecode(json);
    final settings = AppSettings.fromJson(map);
    return settings;
  }

  void writeAppSettings(AppSettings settings) {
    String json = jsonEncode(settings);
    _storage.write('settings', json);
  }
}
