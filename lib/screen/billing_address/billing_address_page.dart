import 'package:flutter/material.dart';
import 'package:tamara_sdk_example/model/order_detail.dart';
import 'package:tamara_flutter_sdk/tamara_sdk.dart';
import 'package:tamara_sdk_example/screen/render_webview/tamara_payment.dart';
import 'package:tamara_sdk_example/widgets/my_app_bar_widget.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_text_field_widget.dart';
import 'dart:convert';

class BillingAddressPage extends StatefulWidget {
  const BillingAddressPage({super.key});

  @override
  State<BillingAddressPage> createState() => _BillingAddressPageState();
}

class _BillingAddressPageState extends State<BillingAddressPage> {
  ValueNotifier<String> firstNameValueNotifier = ValueNotifier("Mona");
  ValueNotifier<String> lastNameValueNotifier = ValueNotifier("Lisa");
  ValueNotifier<String> phoneValueNotifier = ValueNotifier("502223337");
  ValueNotifier<String> address1ValueNotifier =
      ValueNotifier("3764 Al Urubah Rd");
  ValueNotifier<String> address2ValueNotifier = ValueNotifier("");
  ValueNotifier<String> countryValueNotifier = ValueNotifier("SA");
  ValueNotifier<String> regionValueNotifier = ValueNotifier("As Sulimaniyah");
  ValueNotifier<String> cityValueNotifier = ValueNotifier("Riyadh");
  String _status = "Ready";
  void setShippingAddress() {
    TamaraSdk.setShippingAddress(
        firstNameValueNotifier.value,
        lastNameValueNotifier.value,
        phoneValueNotifier.value,
        address1ValueNotifier.value,
        address2ValueNotifier.value,
        countryValueNotifier.value,
        regionValueNotifier.value,
        cityValueNotifier.value);
  }

  void payViaTamara() async {
    setShippingAddress();
    TamaraSdk.setBillingAddress(
        firstNameValueNotifier.value,
        lastNameValueNotifier.value,
        phoneValueNotifier.value,
        address1ValueNotifier.value,
        address2ValueNotifier.value,
        countryValueNotifier.value,
        regionValueNotifier.value,
        cityValueNotifier.value);
    String result = await TamaraSdk.paymentOrder();
    final checkout = Checkout.fromJson(jsonDecode(result));
    if (checkout != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TamaraPayment(
              url: checkout.checkout_url ?? "",
              isCheckoutWebview: true,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MyTextFieldWidget(
              textValueNotifier: firstNameValueNotifier,
              hintText: "First name",
            ),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              textValueNotifier: lastNameValueNotifier,
              hintText: "Last name",
            ),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              textValueNotifier: phoneValueNotifier,
              hintText: "Phone",
            ),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              textValueNotifier: address1ValueNotifier,
              hintText: "Address 1",
            ),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              textValueNotifier: address2ValueNotifier,
              hintText: "Address 2",
            ),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              textValueNotifier: countryValueNotifier,
              hintText: "Country",
            ),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              textValueNotifier: regionValueNotifier,
              hintText: "Region",
            ),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              textValueNotifier: cityValueNotifier,
              hintText: "City",
            ),
            const SizedBox(height: 24),
            MyButtonWidget(
              title: "Split in 4 to 4 payments with Tamara",
              onPressed: () {
                payViaTamara();
              },
              padding: EdgeInsets.zero,
            )
          ],
        ),
      ),
    );
  }
}
