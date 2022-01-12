import 'package:get/instance_manager.dart';
import 'package:to_do/app/module/onBoarding/on_board_controller.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
