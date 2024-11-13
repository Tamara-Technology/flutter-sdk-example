import 'package:flutter/material.dart';

class MyTextTitleInforWidget extends StatelessWidget {
  final String title;
  final AlignmentGeometry? alignment;
  const MyTextTitleInforWidget({
    super.key,
    required this.title,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: alignment ?? Alignment.bottomCenter,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
