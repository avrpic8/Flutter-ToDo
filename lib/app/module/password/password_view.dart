import 'package:flutter/material.dart';
import 'package:to_do/app/core/util/extentions.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'Password',
                style:
                TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
