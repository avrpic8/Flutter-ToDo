import 'package:get/instance_manager.dart';
import 'package:to_do/app/module/password/password_controller.dart';

class PasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PasswordController());
  }
}
