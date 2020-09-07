import 'package:flutter/material.dart';
import 'package:tartlabsstore/src/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.appBarColor,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
