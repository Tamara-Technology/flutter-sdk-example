import 'package:tamara_sdk_example/model/e_amount.dart';
import 'package:tamara_sdk_example/model/item.dart';

class CancelOrder2 {
  EAmount? totalAmount;
  EAmount? taxAmount;
  EAmount? shippingAmount;
  EAmount? discountAmount;
  List<Item>? items;

  CancelOrder2({
    this.totalAmount,
    this.taxAmount,
    this.shippingAmount,
    this.discountAmount,
    this.items,
  });

  CancelOrder2.fromJson(Map<String, dynamic> json) {
    totalAmount = EAmount.fromJson(json['total_amount']);
    taxAmount = EAmount.fromJson(json['tax_amount']);
    shippingAmount = EAmount.fromJson(json['shipping_amount']);
    discountAmount = EAmount.fromJson(json['discount_amount']);
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((itemJson) {
        items?.add(Item.fromJson(itemJson));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_amount'] = totalAmount?.toJson();
    data['tax_amount'] = taxAmount?.toJson();
    data['shipping_amount'] = shippingAmount?.toJson();
    data['discount_amount'] = discountAmount?.toJson();
    if (items != null) {
      data['items'] = items?.map((item) => item.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'CancelOrder2{totalAmount: $totalAmount, taxAmount: $taxAmount, shippingAmount: $shippingAmount, discountAmount: $discountAmount, items: $items}';
  }
}
