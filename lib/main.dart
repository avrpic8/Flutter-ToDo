import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/app/core/util/messages.dart';
import 'package:to_do/app/data/providers/task/settings_provider.dart';
import 'package:to_do/app/data/services/storage/services.dart';
import 'package:to_do/app/module/home/home_binding.dart';
import 'package:to_do/app/module/home/home_view.dart';
import 'package:to_do/app/module/report/report_binding.dart';
import 'package:to_do/app/module/report/report_view.dart';
import 'package:to_do/app/module/settings/settings_controller.dart';

void main() async {
  /// init get storage before run app
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController(settingsProvider: SettingsProvider()));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Messages(),
      locale: Locale('en'),
      home: const HomePage(),
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/reports',
          page: () => ReportPage(tasks: []),
          binding: ReportBinding(),
        ),
      ],
      builder: EasyLoading.init(),
    );
  }
}
