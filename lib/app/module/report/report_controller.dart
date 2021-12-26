import 'package:get/get.dart';
import 'package:to_do/app/data/models/task.dart';

class ReportController extends GetxController{

  late List<Task> tasks;

  void initTask(List<Task> tasks) => this.tasks = tasks;

  int getTotalTask() {
    int res = 0;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].todos != null) {
        res += tasks[i].todos!.length;
      }
    }
    return res;
  }

  int getTotalDoneTask() {
    int res = 0;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].todos != null) {
        for (int j = 0; j < tasks[i].todos!.length; j++) {
          if (tasks[i].todos![j]['done'] == true) {
            res += 1;
          }
        }
      }
    }
    return res;
  }
}