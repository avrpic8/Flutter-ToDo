import 'package:get/get.dart';
import 'package:to_do/app/data/providers/task/provider.dart';
import 'package:to_do/app/data/services/storage/repository.dart';
import 'package:to_do/app/module/home/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(taskProvider: TaskProvider()),
      ),
    );
  }
}
