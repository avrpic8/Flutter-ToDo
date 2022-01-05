import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = Theme.of(context).textTheme;

    final width = MediaQuery.of(context).size.width * 0.9;
    final height = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Card(color: Color(0xff212121),
              child: Column(
                children: [
                  TextField()
                ],
              ),)
            ],
          ),
        )
      ),
    );
  }
}
