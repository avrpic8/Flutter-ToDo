import 'package:get/get.dart';
import 'package:to_do/app/data/models/Settings.dart';
import 'package:to_do/app/data/services/storage/services.dart';

class SettingsProvider{

  final _storage = Get.find<StorageService>();

  Settings readParameters(){
    return _storage.read('settings');
  }

  void writeParameters(Settings settings){
    _storage.write('settings', settings);
  }
}