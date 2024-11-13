import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_text_field_widget.dart';

class DialogInputOrderIdWidget extends StatefulWidget {
  final Function(String) onPress;
  const DialogInputOrderIdWidget({super.key, required this.onPress});

  @override
  State<DialogInputOrderIdWidget> createState() =>
      _DialogInputOrderIdWidgetState();
}

class _DialogInputOrderIdWidgetState extends State<DialogInputOrderIdWidget> {
  ValueNotifier<String> orderIdValueNotifier =
      ValueNotifier("9af217f1-9e4a-400e-9e06-2b7f4f40687e");
  void onPressed() {
    if (orderIdValueNotifier.value.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please input",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 110, 110, 110),
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }
    widget.onPress(orderIdValueNotifier.value);
  }

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
                    MyTextFieldWidget(
                      textValueNotifier: orderIdValueNotifier,
                      hintText: "Order Id",
                    ),
                    const SizedBox(height: 10),
                    MyButtonWidget(
                      title: "OK",
                      onPressed: () {
                        onPressed();
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
