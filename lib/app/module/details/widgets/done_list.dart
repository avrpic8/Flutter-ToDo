import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/util/extentions.dart';
import 'package:to_do/app/core/values/colors.dart';
import 'package:to_do/app/module/home/home_controller.dart';

class DoneTodo extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  DoneTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtr.doneTodos.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  child: Text(
                    'Completed(${homeCtr.doneTodos.length})',
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ...homeCtr.doneTodos
                    .map(
                      (element) => Dismissible(
                        key: ObjectKey(element),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => homeCtr.deleteDoneTodo(element),
                        background: Container(
                          color: Colors.red.withOpacity(0.8),
                          alignment: Alignment.centerRight,
                          child:  Padding(
                            padding:  EdgeInsets.only(right: 5.0.wp),
                            child: const Icon(Icons.delete,color: Colors.white,),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0.wp,
                            vertical: 3.0.wp,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  Icons.done,
                                  color: blue,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                element['title'],
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList()
              ],
            )
          : Container(),
    );
  }
}
