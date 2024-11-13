import 'package:flutter/material.dart';

import 'package:tamara_sdk_example/model/item.dart';
import 'package:tamara_sdk_example/widgets/text_format_number_widget.dart';

class ListViewSelectItemsWidget extends StatelessWidget {
  final ValueNotifier<List<Item>> itemList;
  final Function(int, bool) updateQuantity;

  const ListViewSelectItemsWidget(
      {super.key, required this.updateQuantity, required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemCount: itemList.value.length,
      itemBuilder: (context, index) {
        final item = itemList.value[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 0.2,
                color: Color.fromARGB(255, 212, 212, 212),
                offset: Offset(0, 0),
              ),
              BoxShadow(
                blurRadius: 2,
                color: Color.fromARGB(255, 212, 212, 212),
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name.toString()),
                  const SizedBox(height: 3),
                  Text(item.sku.toString()),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      item.discountAmount!.amount! > 0
                          ? Row(
                              children: [
                                TextFormatNumberWidget(
                                  num: item.unitAmount!.amount!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey,
                                    decorationThickness: 1,
                                    decorationStyle: TextDecorationStyle.solid,
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            )
                          : Container(),
                      TextFormatNumberWidget(
                        num: item.unitAmount!.amount! -
                            item.discountAmount!.amount!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                      "Tax: ${item.taxtAmount!.amount} ${item.taxtAmount!.currency}"),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      updateQuantity(index, false);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 25,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      item.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      updateQuantity(index, true);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
