import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/module/settings/settings_controller.dart';

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
            Container(
              margin: EdgeInsets.only(top: 20),
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
            Padding(
              padding: EdgeInsets.fromLTRB(4.0.wp, 0, 0, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.language,
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
                          'Language',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Obx(
                          () => Text(
                            controller.locale.value ? 'Persian' : 'English',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 4.0.wp),
                    child: Obx(
                      () => Switch(
                        value: controller.locale.value,
                        onChanged: (newValue) {
                          controller.changeLanguage(newValue);
                        },
                      ),
                    ),
                  )
                ],
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
            Padding(
              padding: EdgeInsets.fromLTRB(4.0.wp, 0, 0, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.color_lens,
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
                          'Theme',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Obx(
                          () => Text(
                            controller.isDark.value ? 'Dark' : 'Light',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 4.0.wp),
                    child: Obx(
                      () => Switch(
                        value: controller.isDark.value,
                        onChanged: (value) {
                          controller.changeTheme(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
