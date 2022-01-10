import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/constants.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/data/services/storage/repository.dart';
import 'package:to_do/app/data/services/storage/services.dart';
import 'package:to_do/app/module/auth/PassCheck.dart';
import 'package:to_do/app/module/settings/settings_controller.dart';
import 'package:to_do/main.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;

  final settingCtr = Get.find<SettingsController>();
  final _storage = Get.find<StorageService>();

  final formKey = GlobalKey<FormState>();
  final editCtr = TextEditingController();
  final tasks = <Task>[].obs;
  final chipIndex = 0.obs;
  final deleting = false.obs;
  final task = Rx<Task?>(null);
  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;
  final tabIndex = 0.obs;
  DateTime _timeBackPress = DateTime.now();

  HomeController({required this.taskRepository});

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onReady() {
    super.onReady();
    var pass = _storage.read(allowAccess);
    if(settingCtr.settings.requirePass && pass!=null && Get.arguments != 'passed')
      Get.off(PassCheck());
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    tasks.refresh();
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

  void doneTodo(String title) {
    var doingTodo = {'title': title, 'done': false};
    int index = doingTodos.indexWhere(
        (element) => mapEquals<String, dynamic>(doingTodo, element));
    doingTodos.removeAt(index);

    var doneTodo = {'title': title, 'done': true};
    doneTodos.add(doneTodo);

    doingTodos.refresh();
    doneTodos.refresh();
  }

  int deleteDoneTodo(dynamic doneTodo) {
    int index = doneTodos
        .indexWhere((element) => mapEquals<String, dynamic>(doneTodo, element));
    doneTodos.removeAt(index);
    doneTodos.refresh();
    return index;
  }

  bool isTodoEmpty(Task task) {
    return task.todos == null || task.todos!.isEmpty;
  }

  int getDoneTodo(Task task) {
    var res = 0;
    for (int i = 0; i < task.todos!.length; i++) {
      if (task.todos![i]['done'] == true) res += 1;
    }
    return res;
  }

  void backToDoneTodo({dynamic doneTodo, required int index}) {
    doneTodos.insert(index, doneTodo);
    doneTodos.refresh();
  }

  void setTabIndex(int value) {
    tabIndex.value = value;
  }

  Future<bool> saveAndExit(Task task) async {
    updateTodos(task);
    editCtr.clear();
    Get.back();
    return true;
  }

  Future<bool> onWillPop() async {
    var difference = DateTime.now().difference(_timeBackPress);
    var isExitWarning = difference >= Duration(seconds: 2);
    _timeBackPress = DateTime.now();

    if (isExitWarning) {
      EasyLoading.showToast('press_back_again_to_exit'.tr,
          duration: Duration(seconds: 2),
          toastPosition: EasyLoadingToastPosition.center);
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    editCtr.dispose();
    super.onClose();
  }
}
