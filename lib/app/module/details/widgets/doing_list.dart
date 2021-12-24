import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/module/home/home_controller.dart';

class DoingList extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtr.doingTodos.isEmpty && homeCtr.doneTodos.isEmpty
          ? Column(
              children: [
                Image.asset(
                  'assets/images/box.png',
                  fit: BoxFit.cover,
                  width: 60.0.wp,
                ),
                Text(
                  'Add Task',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0.wp),
                )
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ...homeCtr.doingTodos
                    .map(
                      (element) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.wp,
                          vertical: 3.0.wp,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.grey,
                                ),
                                value: element['done'],
                                onChanged: (Value) {
                                  homeCtr.doneTodo(element['title']);
                                },
                              ),
                            ),
                            const SizedBox(width: 6,),
                            Text(
                              element['title'],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                    if(homeCtr.doingTodos.isNotEmpty) Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                      child: const Divider(thickness: 2,),
                    ),
              ],
            ),
    );
  }
}
