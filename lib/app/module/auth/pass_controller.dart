import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/module/home/home_binding.dart';
import 'package:to_do/app/module/home/home_view.dart';
import 'package:to_do/app/module/settings/settings_controller.dart';

class PassController extends GetxController {
  final settingCtr = Get.find<SettingsController>();
  final editAskPassCtr = TextEditingController();

  void comparePassword(String pass) {
    print(pass);
    String? savedPass = settingCtr.settings.password;
    if (savedPass == pass) {
      Get.off(HomePage(), binding: HomeBinding(), arguments: 'passed');
    } else {
      EasyLoading.showToast('the_password_is_wrong'.tr,
          duration: 2.seconds, toastPosition: EasyLoadingToastPosition.center);
    }
  }
}