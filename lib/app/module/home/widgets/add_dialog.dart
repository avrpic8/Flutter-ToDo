import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/module/home/home_controller.dart';

class AddDialog extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();

  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Form(
        key: homeCtr.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      homeCtr.editCtr.clear();
                      homeCtr.changeTask(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  TextButton(
                    onPressed: () {
                      if (homeCtr.formKey.currentState!.validate()) {
                        if (homeCtr.task.value == null) {
                          EasyLoading.showError('please_select_task_type'.tr);
                        } else {
                          var success = homeCtr.updateTask(
                              homeCtr.task.value!, homeCtr.editCtr.text);
                          if (success) {
                            EasyLoading.showSuccess('todo_item_add_success'.tr);
                            Get.back();
                            homeCtr.changeTask(null);
                          } else {
                            EasyLoading.showError('todo_item_already_exist'.tr);
                          }
                          homeCtr.editCtr.clear();
                        }
                      }
                    },
                    child: Text(
                      'done'.tr,
                      style: txtTheme.subtitle1
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Text(
                'new_task'.tr,
                style: txtTheme.headline6
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                controller: homeCtr.editCtr,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  hintText: 'type_your_todo'.tr,
                  hintStyle: txtTheme.caption?.copyWith(fontSize: 13),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'please_enter_your_new_item'.tr;
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.wp),
              child: Text(
                'add_to'.tr,
                style: txtTheme.bodyText2,
              ),
            ),
            ...homeCtr.tasks.map(
              (element) => Obx(
                () => InkWell(
                  onTap: () => homeCtr.changeTask(element),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4.0.wp, vertical: 2.0.wp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              IconData(element.icon,
                                  fontFamily: 'MaterialIcons'),
                              color: HexColor.fromHex(element.color),
                            ),
                            SizedBox(width: 3.0.wp),
                            Text(
                              element.title,
                              style: txtTheme.caption?.copyWith(fontSize: 14)
                            ),
                          ],
                        ),
                        if (homeCtr.task.value == element)
                          const Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
