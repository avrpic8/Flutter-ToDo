import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/core/values/colors.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/home/home_controller.dart';
import 'package:to_do/app/module/home/widgets/add_card.dart';
import 'package:to_do/app/module/home/widgets/add_dialog.dart';
import 'package:to_do/app/module/home/widgets/task_card.dart';
import 'package:to_do/app/module/report/report_view.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
   late DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0.wp),
                      child: Text(
                        'my_list'.tr,
                        style: TextStyle(
                            fontSize: 24.0.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Obx(
                      () => GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          ...controller.tasks
                              .map(
                                (element) => LongPressDraggable(
                                  data: element,
                                  onDragStarted: () =>
                                      controller.deleteStatus(true),
                                  onDraggableCanceled: (_, __) =>
                                      controller.deleteStatus(false),
                                  feedback: Opacity(
                                    opacity: 0.4,
                                    child: TaskCard(task: element),
                                  ),
                                  child: TaskCard(task: element),
                                ),
                              )
                              .toList(),
                          AddCard()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ReportPage(tasks: controller.tasks),
            ],
          ),
        ),
        floatingActionButton: DragTarget<Task>(
          builder: (_, __, ___) {
            return Obx(
              () => FloatingActionButton(
                backgroundColor: controller.deleting.value ? Colors.red : blue,
                onPressed: () {
                  if (controller.tasks.isNotEmpty) {
                    Get.to(() => AddDialog(), transition: Transition.downToUp);
                  } else {
                    EasyLoading.showError('Please add a task first!');
                  }
                },
                child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
              ),
            );
          },
          onAccept: (Task task) {
            controller.deleteTask(task);
            controller.deleteStatus(false);
            EasyLoading.showSuccess('Delete Success');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          data: ThemeData(
            //splashColor: Colors.transparent,
            //highlightColor: Colors.transparent,
          ),
          child: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (int index) => controller.setTabIndex(index),
              currentIndex: controller.tabIndex.value,
              //showSelectedLabels: false,
              //showUnselectedLabels: false,
              elevation: 20,
              items: [
                BottomNavigationBarItem(
                  label: 'home'.tr,
                  icon: const Icon(Icons.apps),
                ),
                BottomNavigationBarItem(
                  label: 'settings'.tr,
                  icon: const Icon(Icons.settings),
                ),
                BottomNavigationBarItem(
                  label: 'report'.tr,
                  icon: const Icon(Icons.data_usage),
                ),
                BottomNavigationBarItem(
                  label: 'about'.tr,
                  icon: const Icon(Icons.contact_mail),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

   Future<bool> _onWillPop() async{
     DateTime now = DateTime.now();
     if(currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)){
       currentBackPressTime = now;
       Fluttertoast.showToast(msg: 'Press one again to exit.');
       print('hi');
       return false;
     }
     return true;
   }
}
