class CancelOrder {
  String? cancelId;
  String? orderId;

  CancelOrder({
    this.cancelId,
    this.orderId,
  });

  CancelOrder.fromJson(Map<String, dynamic> json) {
    cancelId = json['cancel_id'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cancel_id'] = cancelId;
    data['order_id'] = orderId;
    return data;
  }

  @override
  String toString() {
    return 'CancelOrder{cancelId: $cancelId, orderId: $orderId}';
  }
}
