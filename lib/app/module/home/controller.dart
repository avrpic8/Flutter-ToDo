import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;

  final formKey = GlobalKey<FormState>();
  final editCtr = TextEditingController();
  final tasks = <Task>[].obs;
  final chipIndex = 0.obs;
  final deleting = false.obs;
  final task = Rx<Task?>(null);

  HomeController({required this.taskRepository});

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void deleteStatus(bool value) {
    deleting.value = value;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  void changeTask(Task? select) {
    task.value = select;
  }

  bool updateTask(Task task, String title) {
    var todos = task.todos ?? [];
    if (containTodo(todos, title)) {
      return false;
    }
    var todo = {'title': title, 'done': false};
    todos.add(todo);
    Task newTask = task.copyWith(todos: todos);
    int oldIdx = tasks.indexOf(task);
    tasks[oldIdx] = newTask;
    tasks.refresh();
    //print(tasks);
    return true;
  }

  bool containTodo(List todos, String title) {
    return todos.any((element) => element['title'] == title);
  }

  @override
  void onClose() {
    editCtr.dispose();
    super.onClose();
  }
}
