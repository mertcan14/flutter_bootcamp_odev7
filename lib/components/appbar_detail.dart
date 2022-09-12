import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/my_color.dart';

class AppbarDetail extends StatelessWidget implements PreferredSizeWidget {
  String title;

  @override
  final Size preferredSize;

  AppbarDetail({required this.title}): preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      title: Text(title, style: TextStyle(fontFamily: "DynaPuff"),),
    );
  }
}
