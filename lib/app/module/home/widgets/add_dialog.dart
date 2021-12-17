import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/module/home/controller.dart';

class AddDialog extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();

  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          EasyLoading.showError('Please select task type');
                        } else {
                          var success = homeCtr.updateTask(
                              homeCtr.task.value!, homeCtr.editCtr.text);
                          if (success) {
                            EasyLoading.showSuccess('Todo item add success');
                            Get.back();
                            homeCtr.changeTask(null);
                          } else {
                            EasyLoading.showError('Todo iteme already exist');
                          }
                          homeCtr.editCtr.clear();
                        }
                      }
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 14.0.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: Text(
                'New Task',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: TextFormField(
                controller: homeCtr.editCtr,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your todo items';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.wp),
              child: Text(
                'Add to',
                style: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
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
                              style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold),
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
