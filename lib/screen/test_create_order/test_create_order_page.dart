import 'package:flutter/material.dart';
import 'package:tamara_sdk_example/screen/select_items/select_items_page.dart';
import 'package:tamara_flutter_sdk/tamara_sdk.dart';
import 'package:tamara_sdk_example/widgets/checkbox_widget.dart';
import 'package:tamara_sdk_example/widgets/my_app_bar_widget.dart';
import 'package:tamara_sdk_example/widgets/my_auto_size_text_filed_widget.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/my_text_title_infor_widget.dart';

import '../../widgets/my_text_field_widget.dart';

class TestCreateOrderPage extends StatefulWidget {
  const TestCreateOrderPage({super.key});

  @override
  State<TestCreateOrderPage> createState() => _TestCreateOrderPageState();
}

class _TestCreateOrderPageState extends State<TestCreateOrderPage> {
  ValueNotifier<String> firstNameValueNotifier = ValueNotifier("Mona");
  ValueNotifier<String> lastNameValueNotifier = ValueNotifier("Lisa");
  ValueNotifier<String> emailValueNotifier = ValueNotifier("user@example.com");
  ValueNotifier<String> phoneValueNotifier = ValueNotifier("502223333");
  ValueNotifier<String> riskValueNotifier = ValueNotifier("");
  ValueNotifier<bool> isFirstOrderValueNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: const [
                  Text(
                    "Consumer's Information",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 0.2,
                      color: Color.fromARGB(255, 212, 212, 212),
                      offset: Offset(-1, 0),
                    ),
                    BoxShadow(
                      blurRadius: 2,
                      color: Color.fromARGB(255, 212, 212, 212),
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTextTitleInforWidget(title: "Firts name"),
                        MyAutoSizeTextFieldWidget(
                            textValueNotifier: firstNameValueNotifier),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTextTitleInforWidget(title: "Last name"),
                        MyAutoSizeTextFieldWidget(
                            textValueNotifier: lastNameValueNotifier),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTextTitleInforWidget(title: "Email"),
                        MyAutoSizeTextFieldWidget(
                            textValueNotifier: emailValueNotifier),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTextTitleInforWidget(title: "Phone"),
                        MyAutoSizeTextFieldWidget(
                            textValueNotifier: phoneValueNotifier),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ValueListenableBuilder(
                      valueListenable: isFirstOrderValueNotifier,
                      builder: (context, value, child) {
                        return CheckBoxWidget(
                            isCheck: isFirstOrderValueNotifier,
                            onChanged: (value) {
                              isFirstOrderValueNotifier.value = value;
                            },
                            title: "This is my first order");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Text(
                    "Risk Assessment",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTextFieldWidget(
                    textValueNotifier: riskValueNotifier,
                    hintText: "Input json",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MyButtonWidget(
                title: "SELECT ITEMS",
                padding: const EdgeInsets.symmetric(vertical: 16),
                onPressed: () async {
                  TamaraSdk.setPaymentType("PAY_BY_INSTALMENTS");
                  bool result = await TamaraSdk.setRiskAssessment(riskValueNotifier.value);
                  if (result) {
                    //json ok
                  }
                  TamaraSdk.setCustomerInfo(
                      firstNameValueNotifier.value,
                      lastNameValueNotifier.value,
                      phoneValueNotifier.value,
                      emailValueNotifier.value,
                      isFirstOrderValueNotifier.value);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectItemsPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
