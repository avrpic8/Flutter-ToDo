import 'package:flutter/material.dart';
import 'package:to_do/app/core/util/extentions.dart';

class SingleRowSetting extends StatelessWidget {
  final IconData icons;
  final String titleSetting;
  final String subTitleSetting;
  final String subTitleSettingNot;
  final bool? condition;
  final Widget switchWidget;

  SingleRowSetting({
    Key? key,
    required this.icons,
    required this.titleSetting,
    required this.subTitleSetting,
    required this.subTitleSettingNot,
    this.condition,
    required this.switchWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.0.wp, 0, 0, 0),
      child: Row(
        children: [
          Icon(
            icons,
            size: 22,
            color: Colors.grey,
          ),
          SizedBox(
            width: 32,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleSetting,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  condition ?? false ? subTitleSetting : subTitleSettingNot,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 4.0.wp), child: switchWidget)
        ],
      ),
    );
  }
}
