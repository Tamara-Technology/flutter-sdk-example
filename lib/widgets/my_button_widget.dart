import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.padding,
  });

  final String title;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            fixedSize: Size(screenWidth, 40),
            elevation: 0),
      ),
    );
  }
}
