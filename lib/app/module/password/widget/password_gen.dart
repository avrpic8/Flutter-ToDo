import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../password_controller.dart';

class PasswordGen extends StatelessWidget {
  const PasswordGen({
    Key? key,
    required this.controller,
    required this.theme,
  }) : super(key: key);

  final PasswordController controller;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'enter_your_new_password'.tr,
                style: theme.textTheme.subtitle1?.copyWith(
                  fontSize: 14,
                  color: theme.textTheme.headline6?.color,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'please_fill_the_password'.tr;
                  }
                  if (value.length < 6) {
                    return 'please_length_must_be_6_character_or_more'.tr;
                  } else
                    return null;
                },
                controller: controller.editPassCtr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'new_password'.tr,
                  labelStyle: theme.textTheme.caption?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value != controller.editPassCtr.text) {
                    return 'the_enterd_passwords_not_match'.tr;
                  } else
                    return null;
                },
                controller: controller.editConfirmPassCtr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'confirm_password'.tr,
                  labelStyle: theme.textTheme.caption?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
