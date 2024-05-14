import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

class ResumeListTileSection extends StatelessWidget {
  final Icon tileIcon;
  final String title;
  final String pageRouteName;

  const ResumeListTileSection({super.key, required this.tileIcon, required this.title, required this.pageRouteName});

  @override
  Widget build(BuildContext context) {
    return GFListTile(
        titleText: title,
        icon: tileIcon,
        onTap: () => Get.toNamed(pageRouteName),
    );
  }
}
