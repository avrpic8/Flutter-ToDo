import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/core/values/colors.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/report/report_controller.dart';

class ReportPage extends StatelessWidget {

  final controller = Get.put(ReportController());
  final List<Task> tasks;
  ReportPage({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final txtTheme = Theme.of(context).textTheme;

    controller.initTask(tasks);
    var createdTasks = controller.getTotalTask();
    var completeTasks = controller.getTotalDoneTask();
    var liveTasks = createdTasks - completeTasks;
    var percent = (completeTasks / createdTasks * 100);

    return Scaffold(
      body: SafeArea(
        child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(4.0.wp),
                  child: Text(
                    'my_report'.tr,
                    style: txtTheme.headline6
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Text(
                    DateFormat.yMMMMd().format(
                      DateTime.now(),
                    ),
                    style: txtTheme.caption?.copyWith(fontSize: 14, color: Colors.purple)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4.0.wp, vertical: 3.0.wp),
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child:
                            _buildStatus(Colors.green, liveTasks, 'live_task'.tr, txtTheme),
                      ),
                      Expanded(
                        child: _buildStatus(
                            Colors.orange, completeTasks, 'complete_task'.tr, txtTheme),
                      ),
                      Expanded(
                        child:
                            _buildStatus(Colors.blue, createdTasks, 'create_task'.tr, txtTheme),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0.wp,
                ),
                UnconstrainedBox(
                  child: SizedBox(
                    width: 70.0.wp,
                    height: 70.0.wp,
                    child: CircularStepProgressIndicator(
                      totalSteps: createdTasks == 0 ? 1 : createdTasks,
                      currentStep: completeTasks,
                      stepSize: 20,
                      selectedColor: green,
                      unselectedColor: Colors.grey.shade200,
                      padding: 0,
                      width: 150,
                      height: 150,
                      selectedStepSize: 22,
                      roundedCap: (_, __) => true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${createdTasks == 0 ? 0 : percent.toInt()}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0.sp,
                            ),
                          ),
                          SizedBox(height: 2.0.wp,),
                          const Text(
                            'Efficiently',
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )

        ),
      );

  }

  Row _buildStatus(Color color, int amount, String text, TextTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 3.0.wp,
          height: 3.0.wp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 0.5.wp,
              color: color,
            ),
          ),
        ),
        SizedBox(
          width: 2.0.wp,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$amount',
              style: theme.caption?.copyWith(fontSize: 14, fontWeight: FontWeight.bold)
            ),
            SizedBox(
              height: 1.0.wp,
            ),
            Text(
              text,
              style: theme.caption?.copyWith(fontSize: 14 ,fontWeight: FontWeight.bold)
            ),
          ],
        )
      ],
    );
  }
}
