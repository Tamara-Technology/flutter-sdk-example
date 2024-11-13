import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final ValueNotifier<String> textValueNotifier;
  final String? hintText;
  final TextInputType? keyboardType;
  const MyTextFieldWidget({
    super.key,
    required this.textValueNotifier,
    this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    _controller.text = textValueNotifier.value;

    return TextField(
      keyboardType: keyboardType,
      controller: _controller,
      decoration: InputDecoration(
        hintText: hintText ?? "",
      ),
      onChanged: (value) {
        textValueNotifier.value = value;
      },
      maxLines: null,
    );
  }
}
