import 'package:flutter/material.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const MyAppBarWidget({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "Tamara Checkout Example App"),
      leadingWidth: 0,
      leading: Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
