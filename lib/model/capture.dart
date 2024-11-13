import 'package:tamara_sdk_example/model/e_amount.dart';
import 'package:tamara_sdk_example/model/item.dart';
import 'package:tamara_sdk_example/model/shipping_infor.dart';

class Capture {
  String? orderId;
  EAmount? totalAmount;
  EAmount? taxAmount;
  EAmount? shippingAmount;
  EAmount? discountAmount;
  List<Item>? items;
  ShippingInfo? shippingInfo;

  Capture({
    this.orderId,
    this.totalAmount,
    this.taxAmount,
    this.shippingAmount,
    this.discountAmount,
    this.items,
    this.shippingInfo,
  });

  Capture.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    totalAmount = EAmount.fromJson(json['total_amount']);
    taxAmount = EAmount.fromJson(json['tax_amount']);
    shippingAmount = EAmount.fromJson(json['shipping_amount']);
    discountAmount = EAmount.fromJson(json['discount_amount']);
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((itemJson) {
        items!.add(Item.fromJson(itemJson));
      });
    }
    shippingInfo = ShippingInfo.fromJson(json['shipping_info']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['total_amount'] = totalAmount?.toJson();
    data['tax_amount'] = taxAmount?.toJson();
    data['shipping_amount'] = shippingAmount?.toJson();
    data['discount_amount'] = discountAmount?.toJson();
    if (items != null) {
      data['items'] = items!.map((item) => item.toJson()).toList();
    }
    data['shipping_info'] = shippingInfo?.toJson();
    return data;
  }

  @override
  String toString() {
    return 'Capture{orderId: $orderId, totalAmount: $totalAmount, taxAmount: $taxAmount, shippingAmount: $shippingAmount, discountAmount: $discountAmount, items: $items, shippingInfo: $shippingInfo}';
  }
}
