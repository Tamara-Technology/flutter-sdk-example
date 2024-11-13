import 'package:tamara_sdk_example/model/e_amount.dart';

class Refund {
  EAmount? totalAmount;
  String? comment;

  Refund({
    this.totalAmount,
    this.comment,
  });

  Refund.fromJson(Map<String, dynamic> json) {
    totalAmount = EAmount.fromJson(json['total_amount']);
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_amount'] = totalAmount?.toJson();
    data['comment'] = comment;
    return data;
  }

  @override
  String toString() {
    return 'Refund{totalAmount: $totalAmount, comment: $comment}';
  }
}
