import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/app_theme.dart';
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
      Get.changeTheme(MyAppTheme.dark().getDarkTheme(settings.lan));
    } else {
      Get.changeTheme(MyAppTheme.light().getLightTheme(settings.lan));
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
    if (isDark.value) {
      Get.changeTheme(MyAppTheme.dark().getDarkTheme(settings.lan));
    } else {
      Get.changeTheme(MyAppTheme.light().getLightTheme(settings.lan));
    }
    saveParametersSettings(settings);
  }

  void splashManage(bool flag) {
    showSplash.value = flag;
    settings.splash = flag;
    saveParametersSettings(settings);
  }

  void removeAllTodos() {
    final Color backgroundColor;
    final Color textColor;
    if(isDark.value){
      backgroundColor = Colors.amber;
      textColor = Colors.black;
    }else{
      backgroundColor = Colors.lightBlue;
      textColor = Colors.white;
    }

    final homCtr = Get.find<HomeController>();
    if (homCtr.tasks.isEmpty) {
      Get.snackbar(
        'attention'.tr,
        'you_dont_have_any_todos_for_now'.tr,
        snackPosition: SnackPosition.TOP,
        backgroundColor: backgroundColor,
        colorText: textColor
      );
    } else {
      Get.defaultDialog(
        radius: 5,
        title: 'alert'.tr,
        middleText: 'this_operation_cant_reverse'.tr,
        confirm: TextButton(
            onPressed: () {
              homCtr.tasks.clear();
              Get.back();
              Get.snackbar(
                  'attention'.tr,
                  'all_todos_hase_been_removed'.tr,
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.amber,
                  colorText: Colors.black
              );
            },
            child: Text('ok'.tr)),
        cancel: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('cancel'.tr)),
      );
    }
    print('removed');
  }
}
