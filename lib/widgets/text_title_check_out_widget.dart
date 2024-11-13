import 'package:flutter/material.dart';

class TextTitleCheckOutWidget extends StatelessWidget {
  final String? title;
  const TextTitleCheckOutWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
