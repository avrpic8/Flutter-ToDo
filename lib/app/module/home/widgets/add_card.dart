import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/home/home_controller.dart';
import 'package:to_do/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();

  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = context.textTheme;
    final theme = context.theme;
    final icons = getIcons();
    var squareWidth = context.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'task_type'.tr,
            titleStyle: txtTheme.headline6,
            content: Container(
              width: context.width * 0.75,
              height: context.height * 0.3,
              child: Form(
                key: homeCtr.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                        child: TextFormField(
                          controller: homeCtr.editCtr,
                          style: TextStyle(
                              color: txtTheme.bodyText2?.color,
                              fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.primary)),
                              labelText: 'title_task'.tr,
                              labelStyle:
                                  TextStyle(color: theme.colorScheme.primary)),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'error_task_title'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                        child: Wrap(
                          spacing: 2,
                          children: icons
                              .map(
                                (e) => Obx(
                                  () {
                                    final index = icons.indexOf(e);
                                    return ChoiceChip(
                                      selectedColor: Colors.grey[200],
                                      pressElevation: 0,
                                      backgroundColor: Colors.white,
                                      label: e,
                                      selected:
                                          homeCtr.chipIndex.value == index,
                                      onSelected: (bool selected) {
                                        homeCtr.chipIndex.value =
                                            selected ? index : 0;
                                      },
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme.colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)),
                        onPressed: () {
                          if (homeCtr.formKey.currentState!.validate()) {
                            int icon =
                                icons[homeCtr.chipIndex.value].icon!.codePoint;
                            String color =
                                icons[homeCtr.chipIndex.value].color!.toHex();
                            var task = Task(
                                title: homeCtr.editCtr.text,
                                icon: icon,
                                color: color);
                            Get.back();
                            homeCtr.addTask(task)
                                ? EasyLoading.showSuccess('create_success'.tr)
                                : EasyLoading.showError('duplicated'.tr);
                          }
                        },
                        child: Text(
                          'confirm'.tr,
                          style:
                              txtTheme.bodyText2?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          homeCtr.editCtr.clear();
          homeCtr.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey.shade400,
          dashPattern: const [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
