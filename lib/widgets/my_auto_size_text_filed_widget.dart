import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class MyAutoSizeTextFieldWidget extends StatelessWidget {
  final ValueNotifier<String> textValueNotifier;

  const MyAutoSizeTextFieldWidget({
    super.key,
    required this.textValueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    TextEditingController _controller = TextEditingController();
    _controller.text = textValueNotifier.value;
    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.5),
      // color: Colors.red,
      height: 35,
      alignment: Alignment.bottomRight,
      child: AutoSizeTextField(
        onChanged: (value) {
          textValueNotifier.value = value;
        },
        fullwidth: false,
        minFontSize: 14,
        maxFontSize: 14,
        controller: _controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
