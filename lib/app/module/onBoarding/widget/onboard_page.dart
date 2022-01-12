import 'package:flutter/material.dart';
import 'package:to_do/app/module/onBoarding/on_board_controller.dart';

class OnBoardPage extends StatelessWidget {
  final OnBoardingController controller;
  final pageIndex;
  const OnBoardPage({
    Key? key,
    required this.controller,
    this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(controller.onBoardPages[pageIndex].imageAsset),
          SizedBox(
            height: 32,
          ),
          Text(
            controller.onBoardPages[pageIndex].title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              controller.onBoardPages[pageIndex].description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
