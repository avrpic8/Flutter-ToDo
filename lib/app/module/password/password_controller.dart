import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/services/storage/services.dart';
import 'package:to_do/app/module/settings/settings_controller.dart';

class PasswordController extends GetxController {
  final settingCtr = Get.find<SettingsController>();
  final _storage = Get.find<StorageService>();

  // widget stats
  final requirePass = false.obs;

  final formKey = GlobalKey<FormState>();
  final editPassCtr = TextEditingController();
  final editConfirmPassCtr = TextEditingController();
  final editAskPassCtr = TextEditingController();

  final permission = true.obs;

  @override
  void onInit() {
    super.onInit();

    requirePass.value = settingCtr.settings.requirePass;
    permission.value = _storage.read('permission');
  }

  void togglePassword(bool flag) {
    requirePass.value = flag;
    settingCtr.settings.requirePass = flag;
    settingCtr.saveParametersSettings(settingCtr.settings);
  }

  void savePasswordAndExit() {
    settingCtr.settings.password = editConfirmPassCtr.text.toString();
    settingCtr.saveParametersSettings(settingCtr.settings);
    EasyLoading.showToast('password_successfully_saved'.tr,
        duration: 2000.milliseconds,
        toastPosition: EasyLoadingToastPosition.center);
    Future.delayed(2000.milliseconds).then((value) => Get.back());
  }

  void setPermission(bool newValue) {
    permission.value = newValue;
    _storage.write('permission', permission.value);
  }

  void comparePassword(String pass) {
    print(pass);
    String? savedPass = settingCtr.settings.password;
    if (savedPass == pass) {
      permission.value = true;
    } else
      permission.value = false;
  }
}
