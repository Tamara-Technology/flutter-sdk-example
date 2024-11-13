import 'package:flutter/material.dart';
import 'package:tamara_sdk_example/model/e_amount.dart';
import 'package:tamara_sdk_example/model/item.dart';
import 'package:tamara_sdk_example/screen/check_out/check_out_page.dart';
import 'package:tamara_flutter_sdk/tamara_sdk.dart';
import 'package:tamara_sdk_example/widgets/listview_select_items_widget.dart';
import 'package:tamara_sdk_example/widgets/my_app_bar_widget.dart';
import 'package:tamara_sdk_example/widgets/my_button_widget.dart';

class SelectItemsPage extends StatefulWidget {
  const SelectItemsPage({super.key});

  @override
  State<SelectItemsPage> createState() => _SelectItemsPageState();
}

class _SelectItemsPageState extends State<SelectItemsPage> {
  ValueNotifier<List<Item>> itemList = ValueNotifier([]);
  @override
  void initState() {
    super.initState();
    addData();
  }

  void addAllItemSdk() {
    TamaraSdk.clearItem();
    for (var element in itemList.value) {
      TamaraSdk.addItem(
          element.name!,
          element.referenceId!,
          element.sku!,
          element.type!,
          element.unitAmount!.amount!,
          element.taxtAmount!.amount!,
          element.discountAmount!.amount!,
          element.quantity!);
    }
  }

  void addData() {
    Item item1 = Item(
        name: "The Flash",
        referenceId: "123",
        sku: "SA-12456",
        type: "Lego",
        unitAmount: EAmount(amount: 100, currency: "SAR"),
        taxtAmount: EAmount(amount: 10, currency: "SAR"),
        discountAmount: EAmount(amount: 35, currency: "SAR"),
        quantity: 1);
    Item item2 = Item(
        name: "Batman",
        referenceId: "123",
        sku: "SA-12459",
        type: "Lego",
        unitAmount: EAmount(amount: 50, currency: "SAR"),
        taxtAmount: EAmount(amount: 10, currency: "SAR"),
        discountAmount: EAmount(amount: 15, currency: "SAR"),
        quantity: 1);
    Item item3 = Item(
        name: "Shazam",
        referenceId: "123",
        sku: "SA-12473",
        type: "Lego",
        unitAmount: EAmount(amount: 90, currency: "SAR"),
        taxtAmount: EAmount(amount: 10, currency: "SAR"),
        discountAmount: EAmount(amount: 35, currency: "SAR"),
        quantity: 1);
    Item item4 = Item(
        name: "Wonder Woman",
        referenceId: "123",
        sku: "SA-12485",
        type: "Lego",
        unitAmount: EAmount(amount: 85, currency: "SAR"),
        taxtAmount: EAmount(amount: 10, currency: "SAR"),
        discountAmount: EAmount(amount: 0, currency: "SAR"),
        quantity: 1);
    Item item5 = Item(
        name: "Black Adam",
        referenceId: "123",
        sku: "SA-12490",
        type: "Lego",
        unitAmount: EAmount(amount: 400, currency: "SAR"),
        taxtAmount: EAmount(amount: 10, currency: "SAR"),
        discountAmount: EAmount(amount: 120, currency: "SAR"),
        quantity: 1);
    itemList.value.add(item1);
    itemList.value.add(item2);
    itemList.value.add(item3);
    itemList.value.add(item4);
    itemList.value.add(item5);
  }

  void updateQuantity(int index, bool isIncrease) {
    if (isIncrease && itemList.value[index].quantity! < 5) {
      itemList.value[index].quantity = itemList.value[index].quantity! + 1;
    } else if (!isIncrease && itemList.value[index].quantity! > 0) {
      itemList.value[index].quantity = itemList.value[index].quantity! - 1;
    }
    itemList.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWidget(),
      body: Column(children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: itemList,
            builder: (context, value, child) {
              return ListViewSelectItemsWidget(
                  updateQuantity: updateQuantity, itemList: itemList);
            },
          ),
        ),
        MyButtonWidget(
          title: "CHECK OUT",
          onPressed: () {
            addAllItemSdk();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckOutPage(itemList: itemList),
              ),
            );
          },
        ),
      ]),
    );
  }
}
