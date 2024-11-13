import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFormatNumberWidget extends StatelessWidget {
  final double num;
  final TextStyle? style;

  const TextFormatNumberWidget({super.key, required this.num, this.style});
  String formatNum(double num) {
    final formatter = NumberFormat('#,###');
    return "${formatter.format(num)} SAR";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatNum(num),
      style: style ??
          const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
