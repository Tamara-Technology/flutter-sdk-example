import 'package:flutter/material.dart';
import 'package:tamara_sdk_example/model/item.dart';
import 'package:tamara_sdk_example/screen/select_address/select_address_page.dart';
import 'package:tamara_flutter_sdk/tamara_sdk.dart';
import 'package:tamara_sdk_example/widgets/checkbox_widget.dart';
import 'package:tamara_sdk_example/widgets/my_app_bar_widget.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';
import 'package:tamara_sdk_example/widgets/text_format_number_widget.dart';
import 'package:tamara_sdk_example/widgets/text_title_check_out_widget.dart';

class CheckOutPage extends StatefulWidget {
  final ValueNotifier<List<Item>> itemList;
  const CheckOutPage({super.key, required this.itemList});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  double priceAfterDiscount = 0;
  double totalTax = 0;
  double shippingFee = 20;
  double lauchEventDiscount = 100;
  ValueNotifier<double> totalPrice = ValueNotifier(0);
  ValueNotifier<bool> isLaunchEventDiscount = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    for (var item in widget.itemList.value) {
      priceAfterDiscount += (item.unitAmount!.amount! * item.quantity!) -
          (item.discountAmount!.amount! * item.quantity!);
      totalTax += item.taxtAmount!.amount! * item.quantity!;
    }
    totalPrice.value = priceAfterDiscount + totalTax + shippingFee;
  }

  void updateTotalPrice(bool isDiscount) {
    isLaunchEventDiscount.value = isDiscount;
    if (isDiscount) {
      totalPrice.value -= lauchEventDiscount;
    } else {
      totalPrice.value += lauchEventDiscount;
    }
  }

  void checkOut() {
    TamaraSdk.setShippingAmount(shippingFee);
    if (isLaunchEventDiscount.value) {
      TamaraSdk.setDiscount(lauchEventDiscount, "Launch event's discount");
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
                      const TextTitleCheckOutWidget(
                        title: "Price after discount",
                      ),
                      TextFormatNumberWidget(
                        num: priceAfterDiscount,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextTitleCheckOutWidget(
                        title: "Tax",
                      ),
                      TextFormatNumberWidget(
                        num: totalTax,
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextTitleCheckOutWidget(
                        title: "Shipping fee",
                      ),
                      TextFormatNumberWidget(
                        num: shippingFee,
                      )
                    ],
                  ),
                  ValueListenableBuilder(
                    valueListenable: isLaunchEventDiscount,
                    builder: (context, value, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CheckBoxWidget(
                              isCheck: isLaunchEventDiscount,
                              onChanged: updateTotalPrice,
                              title: "Launch event's discount"),
                          isLaunchEventDiscount.value
                              ? TextFormatNumberWidget(
                                  num: -lauchEventDiscount,
                                )
                              : Container(),
                        ],
                      );
                    },
                  ),
                  Container(
                    color: Colors.grey,
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total price",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      ValueListenableBuilder(
                        valueListenable: totalPrice,
                        builder: (context, value, child) {
                          return TextFormatNumberWidget(
                            num: totalPrice.value,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 20),
            MyButtonWidget(
              title: "SELECT ADDRESS",
              padding: const EdgeInsets.all(0),
              onPressed: () {
                checkOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectAddressPage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
