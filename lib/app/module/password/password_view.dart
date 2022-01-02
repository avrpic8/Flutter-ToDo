import 'package:flutter/material.dart';
import 'package:to_do/app/core/util/extentions.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'Password',
                style: txtTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
