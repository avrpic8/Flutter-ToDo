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
              padding: EdgeInsets.fromLTRB(4.0.wp, 0, 0, 0),
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
              subTitleSetting: 'Persian',
              subTitleSettingNot: 'English',
              condition: controller.locale.value,
              switchWidget: Obx(
                () => Switch(
                  value: controller.locale.value,
                  onChanged: (newValue) {
                    controller.changeLanguage(newValue);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0.wp, 0, 4.0.wp, 0),
              child: Divider(
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SingleRowSetting(
              icons: Icons.color_lens,
              titleSetting: 'Theme',
              subTitleSetting: 'Light',
              subTitleSettingNot: 'Dark',
              condition: controller.isDark.value,
              switchWidget: Obx(
                () => Switch(
                  value: controller.isDark.value,
                  onChanged: (newValue) {
                    controller.changeTheme(newValue);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0.wp, 0, 4.0.wp, 0),
              child: Divider(
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SingleRowSetting(
              icons: Icons.animation,
              titleSetting: 'Splash',
              subTitleSetting: 'Enable',
              subTitleSettingNot: 'Disable',
              switchWidget: Obx(
                () => Switch(
                  value: controller.isDark.value,
                  onChanged: (newValue) {
                    controller.changeTheme(newValue);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0.wp, 0, 0, 0),
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
            InkWell(
              onTap: () {
                Get.to(PasswordPage());
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.0.wp, 0, 0, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Set your password',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.0.wp),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
