import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_text_field_widget.dart';

class DialogInputCheckPayment extends StatefulWidget {
  final Function(String country, double amount, String currency,
      String phoneNumber, bool isVip) onPress;

  const DialogInputCheckPayment({super.key, required this.onPress});

  @override
  State<DialogInputCheckPayment> createState() =>
      _DialogInputCheckPaymentState();
}

class _DialogInputCheckPaymentState extends State<DialogInputCheckPayment> {
  ValueNotifier<String> countryValueNotifier =
  ValueNotifier("SA");
  ValueNotifier<String> amountValueNotifier = ValueNotifier("100");
  ValueNotifier<String> currencyValueNotifier = ValueNotifier("SAR");
  ValueNotifier<String> phoneNumberValueNotifier = ValueNotifier("");
  ValueNotifier<String> isVipValueNotifier = ValueNotifier("false");

  void onPressed() {
    if (countryValueNotifier.value.isEmpty |
    amountValueNotifier.value.isEmpty |
    currencyValueNotifier.value.isEmpty) {
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
        countryValueNotifier.value,
        double.tryParse(amountValueNotifier.value) ?? 100,
        currencyValueNotifier.value, phoneNumberValueNotifier.value,
        bool.tryParse(isVipValueNotifier.value) ?? false);
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
                      textValueNotifier: countryValueNotifier,
                      hintText: "Country (required)",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: amountValueNotifier,
                      hintText: "Amount (required)",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: currencyValueNotifier,
                      hintText: "Currency (required)",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: phoneNumberValueNotifier,
                      hintText: "PhoneNumber",
                    ),
                    const SizedBox(height: 10),
                    MyTextFieldWidget(
                      textValueNotifier: isVipValueNotifier,
                      hintText: "isVip",
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
