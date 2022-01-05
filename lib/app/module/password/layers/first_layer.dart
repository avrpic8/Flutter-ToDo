import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/colors.dart';

class FirstLayer extends StatelessWidget {
  const FirstLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      decoration: BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0)
        )
      ),
    );
  }
}
