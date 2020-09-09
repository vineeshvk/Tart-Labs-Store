import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/utils/color_resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.APP_BAR,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
