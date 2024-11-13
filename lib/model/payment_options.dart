import 'package:tamara_sdk_example/model/e_amount.dart';

class PaymentOptions {
  String? country;
  EAmount? orderValue;
  String? phoneNumber;
  bool? isVip;

  PaymentOptions({
    this.country,
    this.orderValue,
    this.phoneNumber,
    this.isVip
  });

  PaymentOptions.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    orderValue = EAmount.fromJson(json['order_value']);
    phoneNumber = json['phone_number'];
    isVip = json['is_vip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['order_value'] = orderValue;
    data['phone_number'] = phoneNumber;
    data['is_vip'] = isVip;

    return data;
  }
}