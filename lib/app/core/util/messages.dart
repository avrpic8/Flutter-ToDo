import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'my_list': 'My List',
          'home': 'Home',
          'settings': 'Settings',
          'report': 'Reports',
          'about': 'About',
          'my_report': 'My Report',
          'live_task': 'Live Task',
          'complete_task': 'Completed',
          'create_task': 'Created',

        },
        'fa': {
          'my_list': 'لیست من',
          'home': 'خانه',
          'settings': 'ویژگی ها',
          'report': 'گزارش ها',
          'about': 'درباره',
          'my_report': 'گزارش های من',
          'live_task': 'درحال انجام',
          'complete_task': 'تمام شده',
          'create_task': 'مجموع',
        }
  };
}
