import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;

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

  void changeTodos(List<dynamic> select) {
    doingTodos.clear();
    doneTodos.clear();
    for (int i = 0; i < select.length; i++) {
      var todo = select[i];
      var status = todo['done'];
      if (status == true) {
        doneTodos.add(todo);
      } else {
        doingTodos.add(todo);
      }
    }
  }

  bool addTodo(String title) {
    var todo = {'title': title, 'done': false};
    if (doingTodos
        .any((element) => mapEquals<String, dynamic>(todo, element))) {
      return false;
    }

    var doneTodo = {'title': title, 'done': true};
    if (doneTodos
        .any((element) => mapEquals<String, dynamic>(doneTodo, element))) {
      return false;
    }

    doingTodos.add(todo);
    return true;
  }

  void updateTodos(Task task) {
    var newTodos = <Map<String, dynamic>>[];
    newTodos.addAll([...doingTodos, ...doneTodos]);
    Task newTask = task.copyWith(todos: newTodos);
    int oldIndex = tasks.indexOf(task);
    tasks[oldIndex] = newTask;
    tasks.refresh();
  }

  @override
  void onClose() {
    editCtr.dispose();
    super.onClose();
  }
}
