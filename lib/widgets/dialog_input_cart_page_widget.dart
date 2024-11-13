import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamara_sdk_example/constant.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_text_field_widget.dart';

class DialogInputCartPageWidget extends StatefulWidget {
  final Function(
      String language, String country, String publicKey, double amount) onPress;

  const DialogInputCartPageWidget({super.key, required this.onPress});

  @override
  State<DialogInputCartPageWidget> createState() =>
      _DialogInputCartPageWidgetState();
}

class _DialogInputCartPageWidgetState extends State<DialogInputCartPageWidget> {
  ValueNotifier<String> languageValueNotifier = ValueNotifier("en");
  ValueNotifier<String> countryValueNotifier = ValueNotifier("SA");
  ValueNotifier<String> publicKeyValueNotifier = ValueNotifier(PUBLIC_KEY);
  ValueNotifier<String> amountValueNotifier = ValueNotifier("250");

  void onPressed() {
    if (languageValueNotifier.value.isEmpty |
        countryValueNotifier.value.isEmpty |
        publicKeyValueNotifier.value.isEmpty |
        amountValueNotifier.value.isEmpty) {
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
   
    widget.onPress(languageValueNotifier.value, countryValueNotifier.value,
        publicKeyValueNotifier.value, double.parse(amountValueNotifier.value));

     Navigator.of(context).pop();
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
                      textValueNotifier: languageValueNotifier,
                      hintText: "Language",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: countryValueNotifier,
                      hintText: "Country",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: publicKeyValueNotifier,
                      hintText: "Public key",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: amountValueNotifier,
                      hintText: "Amount",
                      keyboardType: TextInputType.number,
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
