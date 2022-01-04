import 'dart:convert';

import 'package:get/get.dart';
import 'package:to_do/app/core/util/constants.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/data/services/storage/services.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks){
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
