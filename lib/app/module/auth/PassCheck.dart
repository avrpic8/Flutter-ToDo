import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/module/auth/pass_controller.dart';

class PassCheck extends StatelessWidget {
  final passCtr = Get.put(PassController());
  PassCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: passCtr.editAskPassCtr,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'input_password'.tr,
                        labelStyle: theme.textTheme.caption?.copyWith(
                          fontSize: 14,
                          color: theme.colorScheme.secondary,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            passCtr
                                .comparePassword(passCtr.editAskPassCtr.text);
                          },
                        ),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
