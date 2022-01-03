import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/core/values/app_theme2.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/details/details_view.dart';
import 'package:to_do/app/module/home/home_controller.dart';

class TaskCard extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  final Task task;

  TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final txtTheme = Theme.of(context).textTheme;
    final color = HexColor.fromHex(task.color);
    var squareWidth = Get.width - 12.0.wp;

    return GestureDetector(
      onTap: () {
        //homeCtr.changeTask(task);
        homeCtr.changeTodos(task.todos ?? []);
        Get.to(() => DetailPage(), arguments: task);
      },
      child: Container(
        width: squareWidth / 2,
        height: squareWidth/2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface ,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.grey.withOpacity(0.6)
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepProgressIndicator(
              totalSteps: homeCtr.isTodoEmpty(task) ? 1 : task.todos!.length,
              currentStep:
                  homeCtr.isTodoEmpty(task) ? 0 : homeCtr.getDoneTodo(task),
              size: 5,
              padding: 0,
              selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.5), color],
              ),
              unselectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [theme.colorScheme.background, theme.colorScheme.background],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Icon(
                IconData(task.icon, fontFamily: 'MaterialIcons'),
                color: color,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: txtTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2.0.wp,
                  ),
                  Text('${task.todos?.length ?? 0} ' + 'tasks'.tr,
                      style: txtTheme.caption?.copyWith(fontSize: 13)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
