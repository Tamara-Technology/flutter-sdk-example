import 'package:flutter/material.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';

class DialogShowResultWidget extends StatelessWidget {
  const DialogShowResultWidget({super.key, required this.textResult});
  final String textResult;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      elevation: 0.0,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(textResult,
                        style: const TextStyle(color: Colors.black54),
                        textAlign: TextAlign.center),
                    MyButtonWidget(
                      title: "OK",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
