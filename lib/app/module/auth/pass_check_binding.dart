import 'package:get/instance_manager.dart';
import 'package:to_do/app/module/auth/pass_check_controller.dart';

class PassCheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PassCheckController());
  }
}
