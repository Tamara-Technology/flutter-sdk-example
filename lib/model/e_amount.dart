class EAmount {
  double? amount;
  String? currency;

  EAmount({this.amount, this.currency});

  EAmount.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }

  @override
  String toString() {
    return 'EAmount{amount: $amount, currency: $currency}';
  }
}
