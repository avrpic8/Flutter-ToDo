import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/home/controller.dart';

class DetailPage extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();

  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    //var task = homeCtr.task.value;
    Task task = Get.arguments;
    var color = HexColor.fromHex(task.color);

    return Scaffold(
      body: Form(
        key: homeCtr.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                      homeCtr.updateTodos(task);
                      homeCtr.editCtr.clear();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
              child: Row(
                children: [
                  Icon(
                    IconData(
                      task.icon,
                      fontFamily: 'MaterialIcons',
                    ),
                    color: color,
                  ),
                  SizedBox(width: 3.0.wp),
                  Text(
                    task.title,
                    style: themeData.textTheme.headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Obx(
              () {
                var totalTodo =
                    homeCtr.doingTodos.length + homeCtr.doneTodos.length;
                return Padding(
                  padding: EdgeInsets.only(
                    left: 5.0.wp,
                    top: 3.0.wp,
                    right: 18.0.wp,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 3.0.wp,
                      ),
                      Text(
                        '$totalTodo Task',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 3.0.wp,
                      ),
                      Expanded(
                        child: StepProgressIndicator(
                          totalSteps: totalTodo == 0 ? 1 : totalTodo,
                          currentStep: homeCtr.doneTodos.length,
                          size: 5,
                          padding: 0,
                          selectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [color.withOpacity(0.5), color]),
                          unselectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey.shade300,
                                Colors.grey.shade300
                              ]),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 2.0.wp, horizontal: 5.0.wp),
              child: TextFormField(
                controller: homeCtr.editCtr,
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.check_box_outline_blank_outlined,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (homeCtr.formKey.currentState!.validate()) {
                        var success = homeCtr.addTodo(homeCtr.editCtr.text);
                        if (success) {
                          EasyLoading.showSuccess('Todo item add success!');
                        } else {
                          EasyLoading.showError('Todo item already exist!');
                        }
                        homeCtr.editCtr.clear();
                      }
                    },
                    icon: const Icon(
                      Icons.done,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your item';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
