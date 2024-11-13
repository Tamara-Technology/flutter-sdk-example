import 'package:flutter/material.dart';
import 'package:tamara_sdk_example/widgets/text_title_check_out_widget.dart';

class CheckBoxWidget extends StatelessWidget {
  final ValueNotifier<bool> isCheck;
  final Function(bool) onChanged;
  final String title;
  const CheckBoxWidget(
      {super.key,
      required this.isCheck,
      required this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isCheck.value,
          onChanged: (valueCheck) {
            onChanged(valueCheck!);
          },
        ),
        TextTitleCheckOutWidget(
          title: title,
        ),
      ],
    );
  }
}
