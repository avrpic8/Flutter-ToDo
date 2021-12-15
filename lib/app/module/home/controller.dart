import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;

  HomeController({required this.taskRepository});
  final formKey  = GlobalKey<FormState>();
  final editCtr = TextEditingController();

  final tasks = <Task>[].obs;
  final chipIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  void changeChipIndex(int value){
    chipIndex.value = value;
  }

  bool addTask(Task task){
    if(tasks.contains(task)){
      return false;
    }
    tasks.add(task);
    return true;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
