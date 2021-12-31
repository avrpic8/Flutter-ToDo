import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/models/settings.dart';
import 'package:to_do/app/data/providers/task/settings_provider.dart';
import 'package:to_do/app/data/services/storage/services.dart';
import 'package:to_do/app/module/home/home_controller.dart';

class SettingsController extends GetxController {
  final _storage = Get.find<StorageService>();

  // widget stats
  final isDark = false.obs;
  final locale = false.obs;
  final showSplash = true.obs;

  final SettingsProvider settingsProvider;
  late AppSettings settings;

  SettingsController({required this.settingsProvider});

  @override
  void onInit() {
    super.onInit();
    loadParametersSettings();
  }

  void loadParametersSettings() {
    settings = settingsProvider.readAppSettings();

    // theme state
    isDark.value = settings.isDark;

    // locale state
    if (settings.lan == 'en')
      locale.value = false;
    else
      locale.value = true;

    // splash state
    showSplash.value = settings.splash;
  }

  void saveParametersSettings(AppSettings settings) {
    settingsProvider.writeAppSettings(settings);
  }

  void changeTheme(bool newValue) {
    isDark.value = newValue;
    settings.isDark = newValue;
    saveParametersSettings(settings);
    if (isDark.value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  void changeLanguage(bool newValue) {
    locale.value = newValue;
    if (locale.value) {
      Get.updateLocale(Locale('fa'));
      settings.lan = 'fa';
    } else {
      Get.updateLocale(Locale('en'));
      settings.lan = 'en';
    }
    saveParametersSettings(settings);
  }

  void splashManage(bool flag) {
    showSplash.value = flag;
    settings.splash = flag;
    saveParametersSettings(settings);
  }

  void removeAllTodos() {
    final homCtr = Get.find<HomeController>();
    if (homCtr.tasks.isEmpty) {
      Get.snackbar(
        'Attention!',
        'You dont have any todos for now.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.amber,
        colorText: Colors.black
      );
    } else {
      Get.defaultDialog(
        radius: 5,
        middleText: 'This operation cant reverse!',
        confirm: TextButton(
            onPressed: () {
              homCtr.tasks.clear();
              Get.back();
              Get.snackbar(
                  'Attention!',
                  'All todos hase been removed.',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.amber,
                  colorText: Colors.black
              );
            },
            child: Text('Ok')),
        cancel: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel')),
      );
    }
    print('removed');
  }
}
