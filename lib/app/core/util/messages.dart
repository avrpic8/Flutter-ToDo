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
          'task_type': 'Task Type',
          'title_task': 'Title',
          'error_task_title': 'Please enter your task title',
          'create_success': 'Create success',
          'duplicated': 'Duplicated',
          'confirm': 'Confirm',
          'tasks': 'Task',
          'todo_item_add_success': 'Todo item add success!',
          'todo_item_already_exist': 'Todo item already exist!',
          'please_enter_your_new_item': 'Please enter your new item',
          'completed': 'Completed',
          'attention': 'Attention!',
          'do_you_want_to_reverse_this_operation':
              'Do you want to reverse this operation?',
          'undo': 'Undo',
          'empty_task': 'Empty Task',
          'language': 'Language',
          'english': 'English',
          'persian': 'Persian',
          'common': 'Common',
          'theme': 'Theme',
          'dark': 'Dark',
          'light': 'Light',
          'splash': 'Splash',
          'enabled': 'Enabled',
          'disabled': 'Disabled',
          'security': 'Security',
          'password': 'Password',
          'set_your_password': 'Set your password',
          'storage': 'Storage',
          'dataBase': 'DataBase',
          'manage_your_all_todos': 'Manage your all todos',
          'clear_all': 'Clear all',
          'you_dont_have_any_todos_for_now': 'You dont have any todos for now.',
          'alert': 'Alert',
          'this_operation_cant_reverse': 'This operation cant reverse!',
          'all_todos_hase_been_removed': 'All todos hase been removed!',
          'ok': 'Ok',
          'cancel': 'Cancel',
          'please_select_task_type': 'Please select task type',
          'done': 'Done',
          'new_task': 'New Task',
          'add_to': 'Add to',
          'press_back_again_to_exit': 'Press back again to exit',
          'type_your_todo': 'Type your todo',
          'please_add_a_task_first': 'Please add a task first!',
          'delete_success': 'Delete Success',
          'ask_for_password_in_startup': 'Ask for password in startup',
          'enter_your_new_password': 'Enter your new password',
          'please_fill_the_password': 'Please fill the password',
          'please_length_must_be_6_character_or_more':
              'Please length must be 6 character or more',
          'new_password': 'New password',
          'the_enterd_passwords_not_match': 'The enterd passwords not match',
          'confirm_password': 'Confirm password',
          'password_successfully_saved': 'Password successfully saved',
          'password_manage': 'Password manage',
          'input_password': 'Input password',
          'the_password_is_wrong': 'The password is wrong'
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
          'task_type': 'نوع برنامه',
          'title_task': 'عنوان کار',
          'error_task_title': 'لطفا عنوان برنامه خود را وارد کنید',
          'create_success': 'با موفقیت ایجاد شد',
          'duplicated': 'برنامه وارد شده تکراریه',
          'confirm': 'تایید',
          'tasks': 'برنامه',
          'todo_item_add_success': 'برنامه شما اضافه شد!',
          'todo_item_already_exist': 'این برنامه از قبل وجود دارد!',
          'please_enter_your_new_item': 'لطفا عنوان برنامه خود را وارد کنید',
          'completed': 'کامل شده',
          'attention': 'توجه!',
          'do_you_want_to_reverse_this_operation': 'آیا مایل به بازگشت هستید؟',
          'undo': 'برگشت',
          'empty_task': 'هیچ برنامه ای وجود ندارد',
          'language': 'زبان',
          'english': 'انگلیسی',
          'persian': 'فارسی',
          'common': 'رایج',
          'theme': 'پوسته',
          'dark': 'تیره',
          'light': 'روشن',
          'splash': 'صفحه آغاز',
          'enabled': 'فعال',
          'disabled': 'غیرفعال',
          'security': 'حفاظت',
          'password': 'رمز',
          'set_your_password': 'تعیین رمز ورود به برنامه',
          'storage': 'حافظه',
          'dataBase': 'پایگاه داده',
          'manage_your_all_todos': 'مدیریت تمام برنامه ها',
          'clear_all': 'حذف همه',
          'you_dont_have_any_todos_for_now':
              'شما فعلا هیچ برنامه برای حذف ندارید.',
          'alert': 'هشدار',
          'this_operation_cant_reverse': 'این عملیات قابل بازگشت نیست!',
          'all_todos_hase_been_removed': 'تمام برنامه های شما حذف شد',
          'ok': 'قبول دارم',
          'cancel': 'منصرف شدم',
          'please_select_task_type': 'لطفا ابتدا نوع برنامه خود را انتخاب کنید',
          'done': 'ذخیره و خروج',
          'new_task': 'برنامه جدید',
          'add_to': 'به کدام دسته اضافه شود',
          'press_back_again_to_exit': 'کلید بازگشت را یک باره دیگر فشار دهید',
          'type_your_todo': 'برنامه خود را بنویسید',
          'please_add_a_task_first': 'ابتدا یک گروه ایجاد کنید!',
          'delete_success': 'گروه موردنظر پاک شد!',
          'ask_for_password_in_startup': 'برای ورود به برنامه رمز پرسیده شود',
          'enter_your_new_password': 'رمز جدید را وارد کنید',
          'please_fill_the_password': 'لطفا فیلد رمز را پر کنید',
          'please_length_must_be_6_character_or_more':
              'طول رمز باید حداقل 6 کاراکتر باشد',
          'new_password': 'رمز جدید',
          'the_enterd_passwords_not_match': 'رمز وارد شده با یکدیگر یکسان نیست',
          'confirm_password': 'تایید رمز وارد شده',
          'password_successfully_saved': 'رمز ورود تغییر کرد',
          'password_manage': 'مدیریت رمز',
          'input_password': 'ورود رمز',
          'the_password_is_wrong': 'رمز وارد شده صحیح نیست'
        }
      };
}
