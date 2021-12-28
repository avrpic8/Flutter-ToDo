import 'package:get/get.dart';
import 'package:to_do/app/data/models/Settings.dart';
import 'package:to_do/app/data/services/storage/services.dart';

class SettingsProvider{

  final _storage = Get.find<StorageService>();

  readParameters(String key){
    return _storage.read(key);
  }

  void writeParameters(String key, dynamic val){
    _storage.write(key, val);
  }
}