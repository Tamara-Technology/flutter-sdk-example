import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_text_field_widget.dart';

class DialogUpdateOrderReferenceId extends StatefulWidget {
  final Function(String orderId, String orderReferenceId) onPress;

  const DialogUpdateOrderReferenceId({super.key, required this.onPress});

  @override
  State<DialogUpdateOrderReferenceId> createState() =>
      _DialogUpdateOrderReferenceIdState();
}

class _DialogUpdateOrderReferenceIdState
    extends State<DialogUpdateOrderReferenceId> {
  ValueNotifier<String> orderIdValueNotifier =
      ValueNotifier("9af217f1-9e4a-400e-9e06-2b7f4f40687e");
  ValueNotifier<String> orderReferenceIdValueNotifier = ValueNotifier("");

  void onPressed() {
    if (orderIdValueNotifier.value.isEmpty |
        orderReferenceIdValueNotifier.value.isEmpty) {
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
    widget.onPress(
        orderIdValueNotifier.value, orderReferenceIdValueNotifier.value);
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
                    MyTextFieldWidget(
                      textValueNotifier: orderReferenceIdValueNotifier,
                      hintText: "Order reference id",
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
