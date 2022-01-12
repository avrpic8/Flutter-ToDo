import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:to_do/app/module/onBoarding/on_board_controller.dart';
import 'package:to_do/app/module/onBoarding/widget/onboard_page.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.selectedPageIndex,
            itemCount: controller.onBoardPages.length,
            itemBuilder: (context, index) {
              return OnBoardPage(
                controller: controller,
                pageIndex: index,
              );
            },
          ),
          Positioned(
            left: 20,
            bottom: 40,
            child: Row(
              children: List.generate(
                controller.onBoardPages.length,
                (index) => Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: controller.selectedPageIndex.value == index
                          ? Colors.red
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 40,
            child: FloatingActionButton(
              elevation: 0,
              child: Obx(() => Text(controller.isLastPage ? 'Start' : 'Next')),
              onPressed: controller.forwardAction,
            ),
          )
        ],
      ),
    );
  }
}
