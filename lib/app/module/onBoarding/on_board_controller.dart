import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/data/models/on_board.dart';
import 'package:to_do/app/module/home/home_binding.dart';
import 'package:to_do/app/module/home/home_view.dart';

class OnBoardingController extends GetxController {
  RxInt selectedPageIndex = 0.obs;
  var pageController = PageController();

  List<OnBoarding> onBoardPages = [
    OnBoarding(
        imageAsset: 'assets/images/order.png',
        title: 'Simple',
        description: 'Use app very easy and simple'),
    OnBoarding(
        imageAsset: 'assets/images/cook.png',
        title: 'Fast',
        description: 'Create your todos very fast'),
    OnBoarding(
        imageAsset: 'assets/images/deliver.png',
        title: 'Secure',
        description: 'Secure your activities and todo from others'),
  ];

  bool get isLastPage => selectedPageIndex.value == onBoardPages.length - 1;

  void forwardAction() {
    if (isLastPage) {
      Get.off(HomePage(), binding: HomeBinding());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }
}
