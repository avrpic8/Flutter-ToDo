import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/core/values/colors.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/home/controller.dart';
import 'package:to_do/app/module/home/widgets/add_card.dart';
import 'package:to_do/app/module/home/widgets/add_dialog.dart';
import 'package:to_do/app/module/home/widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'My List',
                style:
                TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
                  () =>
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ...controller.tasks
                          .map(
                            (element) =>
                            LongPressDraggable(
                              data: element,
                              onDragStarted: () =>
                                  controller.deleteStatus(true),
                              onDraggableCanceled: (_, __) =>
                                  controller.deleteStatus(false),
                              onDragEnd: (_) => controller.deleteStatus(true),
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
      floatingActionButton: DragTarget<Task>(
        builder: (_, __, ___) {
          return Obx(
                () =>
                FloatingActionButton(
                  backgroundColor: controller.deleting.value
                      ? Colors.red
                      : blue,
                  onPressed: () {
                    Get.to(() => AddDialog(), transition: Transition.downToUp);
                  },
                  child: Icon(
                      controller.deleting.value ? Icons.delete : Icons.add),
                ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          controller.deleteStatus(false);
          EasyLoading.showSuccess('Delete Success');
        },
      ),
    );
  }
}
