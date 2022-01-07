import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/core/util/constants.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/home/home_controller.dart';
import 'package:to_do/app/module/home/widgets/add_card.dart';
import 'package:to_do/app/module/home/widgets/add_dialog.dart';
import 'package:to_do/app/module/home/widgets/task_card.dart';
import 'package:to_do/app/module/report/report_view.dart';
import 'package:to_do/app/module/settings/settings_view.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _reportKey = GlobalKey();
  final GlobalKey<NavigatorState> _settingsKey = GlobalKey();
  final GlobalKey<NavigatorState> _aboutKey = GlobalKey();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () => controller.onWillPop(),
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              _navigate(
                  index: homeIndex,
                  screen: SafeArea(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0.wp),
                          child: Text(
                            'my_list'.tr,
                            style: txtTheme.headline6,
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
                              AddCard(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              _navigate(
                  key: _reportKey,
                  index: reportIndex,
                  screen: ReportPage(tasks: controller.tasks)),
              _navigate(
                  key: _settingsKey,
                  index: settingsIndex,
                  screen: SettingsPage())
            ],
          ),
        ),
        floatingActionButton: DragTarget<Task>(
          builder: (_, __, ___) {
            return Obx(
              () => FloatingActionButton(
                backgroundColor: controller.deleting.value
                    ? Colors.red
                    : theme.colorScheme.secondary,
                onPressed: () {
                  if (controller.tasks.isNotEmpty) {
                    Get.to(() => AddDialog(), transition: Transition.downToUp);
                  } else {
                    EasyLoading.showError('please_add_a_task_first'.tr);
                  }
                },
                child:
                    Icon(controller.deleting.value ? Icons.delete : Icons.add),
              ),
            );
          },
          onAccept: (Task task) {
            controller.deleteTask(task);
            controller.deleteStatus(false);
            EasyLoading.showSuccess('delete_success'.tr);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          data: theme.copyWith(
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
                  label: 'report'.tr,
                  icon: const Icon(Icons.data_usage),
                ),
                BottomNavigationBarItem(
                  label: 'settings'.tr,
                  icon: const Icon(Icons.settings),
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

  Widget _navigate(
      {GlobalKey? key, required int index, required Widget screen}) {
    return key?.currentState == null && controller.tabIndex.value != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                      offstage: controller.tabIndex.value != index,
                      child: screen,
                    )),
          );
  }
}
