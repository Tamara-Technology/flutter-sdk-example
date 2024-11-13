import 'package:tamara_sdk_example/model/e_amount.dart';

class Item {
  String? referenceId;
  String? type;
  String? name;
  String? sku;
  String? imageUrl;
  String? itemUrl;
  int? quantity;
  EAmount? unitAmount;
  EAmount? discountAmount;
  EAmount? taxtAmount;
  EAmount? totalAmount;

  Item({
    this.referenceId,
    this.type,
    this.name,
    this.sku,
    this.imageUrl,
    this.itemUrl,
    this.quantity,
    this.unitAmount,
    this.discountAmount,
    this.taxtAmount,
    this.totalAmount,
  });

  Item.fromJson(Map<String, dynamic> json) {
    referenceId = json['reference_id'];
    type = json['type'];
    name = json['name'];
    sku = json['sku'];
    imageUrl = json['image_url'];
    itemUrl = json['item_url'];
    quantity = json['quantity'];
    unitAmount = EAmount.fromJson(json['unit_price']);
    discountAmount = EAmount.fromJson(json['discount_amount']);
    taxtAmount = EAmount.fromJson(json['tax_amount']);
    totalAmount = EAmount.fromJson(json['total_amount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference_id'] = referenceId;
    data['type'] = type;
    data['name'] = name;
    data['sku'] = sku;
    data['image_url'] = imageUrl;
    data['item_url'] = itemUrl;
    data['quantity'] = quantity;
    data['unit_price'] = unitAmount?.toJson();
    data['discount_amount'] = discountAmount?.toJson();
    data['tax_amount'] = taxtAmount?.toJson();
    data['total_amount'] = totalAmount?.toJson();

    return data;
  }

  @override
  String toString() {
    return 'Item{referenceId: $referenceId, type: $type, name: $name, sku: $sku, imageUrl: $imageUrl, itemUrl: $itemUrl, quantity: $quantity, unitAmount: $unitAmount, distcountAmount: $discountAmount, taxtAmount: $taxtAmount, totalAmount: $totalAmount}';
  }
}
