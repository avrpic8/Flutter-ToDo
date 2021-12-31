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
                'Settings',
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
                'Common',
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
              titleSetting: 'Language',
              subtitle: Obx(
                () => Text(
                  controller.locale.value ? 'Persian' : 'English',
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
              titleSetting: 'Theme',
              subtitle: Obx(
                () => Text(
                  controller.isDark.value ? 'Dark' : 'Light',
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
              titleSetting: 'Splash',
              subtitle: Obx(
                () => Text(
                  controller.showSplash.value ? 'Enabled' : 'Disabled',
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
                'Security',
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
              titleSetting: 'Password',
              subtitle: Text(
                'Set your password',
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
                'Storage',
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
                titleSetting: 'DataBase',
                subtitle: Text(
                  'Manage your all todos',
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
                  child: Text('Clear all'),
                ),
                showDivider: false)
          ],
        ),
      ),
    );
  }
}
