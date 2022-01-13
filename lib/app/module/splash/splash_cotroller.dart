import 'package:get/get.dart';
import 'package:to_do/app/core/util/constants.dart';
import 'package:to_do/app/data/services/storage/services.dart';
import 'package:to_do/app/module/home/home_view.dart';
import 'package:to_do/app/module/onBoarding/on_board_binding.dart';
import 'package:to_do/app/module/onBoarding/on_board_view.dart';

class SplashController extends GetxController {
  final _storage = Get.find<StorageService>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(2.seconds).then(
      (value) {
        if (_storage.read(showOnboard)) {
          Get.off(() => OnBoardingView(), binding: OnBoardingBinding());
        } else {
          Get.off(() => HomePage());
        }
      },
    );
  }
}
