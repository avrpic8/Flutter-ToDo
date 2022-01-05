import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/details/widgets/doing_list.dart';
import 'package:to_do/app/module/details/widgets/done_list.dart';
import 'package:to_do/app/module/home/home_controller.dart';

class DetailPage extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();

  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme= Theme.of(context);
    final txtTheme= Theme.of(context).textTheme;
    //var task = homeCtr.task.value;
    Task task = Get.arguments;
    var color = HexColor.fromHex(task.color);

    return WillPopScope(
      onWillPop: () => homeCtr.saveAndExit(task),
      child: Scaffold(
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
                        homeCtr.saveAndExit(task);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
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
                      style: txtTheme.headline6

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
                          '$totalTodo ' + 'tasks'.tr,
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
                  style: TextStyle(color: txtTheme.bodyText2?.color,fontWeight: FontWeight.normal),
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
                            EasyLoading.showSuccess('todo_item_add_success'.tr);
                          } else {
                            EasyLoading.showError('todo_item_already_exist'.tr);
                          }
                          homeCtr.editCtr.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.done,
                      ),
                    ),
                    hintText: 'type_your_todo'.tr,
                    hintStyle: txtTheme.caption?.copyWith(fontSize: 13)
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please_enter_your_new_item'.tr;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height:60,),
              DoingList(),
              DoneTodo(),
            ],
          ),
        ),
      ),
    );
  }
}
