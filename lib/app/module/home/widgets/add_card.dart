import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/core/values/colors.dart';
import 'package:to_do/app/data/models/task.dart';
import 'package:to_do/app/module/home/home_controller.dart';
import 'package:to_do/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();

  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final icons = getIcons();
    var squaeWidth = Get.width - 12.0.wp;
    return Container(
      width: squaeWidth / 2,
      height: squaeWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'task_type'.tr,
            titleStyle: theme.headline6,
            content: Form(
              key: homeCtr.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: homeCtr.editCtr,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'title_task'.tr),
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
                        primary: blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: const Size(150, 40)),
                    onPressed: () {
                      if (homeCtr.formKey.currentState!.validate()) {
                        int icon = icons[homeCtr.chipIndex.value]
                            .icon!
                            .codePoint;
                        String color = icons[homeCtr.chipIndex.value]
                            .color!
                            .toHex();
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
                    child: Text('confirm'.tr, style: theme.bodyText2?.copyWith(color: Colors.white),),
                  ),
                ],
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
