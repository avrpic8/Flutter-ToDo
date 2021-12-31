import 'package:get/get.dart';
import 'package:to_do/app/module/home/home_binding.dart';
import 'package:to_do/app/module/home/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        Get.off(HomePage(),binding: HomeBinding());
      },
    );
  }
}
