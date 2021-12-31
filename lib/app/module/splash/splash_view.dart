import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/app/module/splash/splash_cotroller.dart';

class SplashPage extends StatelessWidget {
  final splCtr = Get.put(SplashController());
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              'Note your todo lists',
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
