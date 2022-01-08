import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/module/password/password_controller.dart';
import 'package:to_do/app/module/settings/widgets/SingleRowSetting.dart';

import 'widget/password_gen.dart';

class PasswordPage extends GetView<PasswordController> {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.0.wp),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.1,
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      'password'.tr,
                      style: txtTheme.headline6,
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        SingleRowSetting(
                          icons: Icons.lock,
                          titleSetting: 'ask_for_password_in_startup'.tr,
                          subtitle: Obx(
                            () => Text(
                              controller.requirePass.value
                                  ? 'enabled'.tr
                                  : 'disabled'.tr,
                              style: txtTheme.caption?.copyWith(fontSize: 12),
                            ),
                          ),
                          switchWidget: Obx(
                            () => Checkbox(
                              value: controller.requirePass.value,
                              onChanged: (newValue) {
                                controller.togglePassword(newValue!);
                              },
                            ),
                          ),
                          showDivider: false,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: PasswordGen(
                            controller: controller,
                            theme: theme,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Positioned(
                      bottom: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme.colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)),
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.savePasswordAndExit();
                          }
                        },
                        child: Text(
                          'confirm'.tr,
                          style:
                              txtTheme.bodyText2?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
