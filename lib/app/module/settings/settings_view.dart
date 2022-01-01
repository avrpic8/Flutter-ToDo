import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/module/password/password_view.dart';
import 'package:to_do/app/module/settings/settings_controller.dart';
import 'package:to_do/app/module/settings/widgets/SingleRowSetting.dart';

class SettingsPage extends StatelessWidget {
  final controller = Get.find<SettingsController>();

  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'settings'.tr,
                style:
                    TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
              child: Text(
                'common'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleRowSetting(
              icons: Icons.language,
              titleSetting: 'language'.tr,
              subtitle: Obx(
                () => Text(
                  controller.locale.value ? 'persian'.tr : 'english'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              switchWidget: Obx(
                () => Switch(
                  value: controller.locale.value,
                  onChanged: (newValue) {
                    controller.changeLanguage(newValue);
                  },
                ),
              ),
              showDivider: false,
            ),
            SingleRowSetting(
              icons: Icons.color_lens,
              titleSetting: 'theme'.tr,
              subtitle: Obx(
                () => Text(
                  controller.isDark.value ? 'dark'.tr : 'light'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              switchWidget: Obx(
                () => Switch(
                  value: controller.isDark.value,
                  onChanged: (newValue) {
                    controller.changeTheme(newValue);
                  },
                ),
              ),
              showDivider: false,
            ),
            SingleRowSetting(
              icons: Icons.animation,
              titleSetting: 'splash'.tr,
              subtitle: Obx(
                () => Text(
                  controller.showSplash.value ? 'enabled'.tr : 'disabled'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              switchWidget: Obx(
                () => Switch(
                  value: controller.showSplash.value,
                  onChanged: (newValue) {
                    controller.splashManage(newValue);
                  },
                ),
              ),
              showDivider: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
              child: Text(
                'security'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleRowSetting(
              icons: Icons.lock,
              titleSetting: 'password'.tr,
              subtitle: Text(
                'set_your_password'.tr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              switchWidget: IconButton(
                onPressed: () {
                  Get.to(PasswordPage(), transition: Transition.rightToLeft);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                ),
              ),
              showDivider: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
              child: Text(
                'storage'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleRowSetting(
                icons: Icons.storage,
                titleSetting: 'dataBase'.tr,
                subtitle: Text(
                  'manage_your_all_todos'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                switchWidget: TextButton(
                  onPressed: () {
                    controller.removeAllTodos();
                  },
                  child: Text('clear_all'.tr),
                ),
                showDivider: false),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
