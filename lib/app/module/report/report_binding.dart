import 'package:get/get.dart';
import 'package:to_do/app/module/report/report_controller.dart';

class ReportBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }
}