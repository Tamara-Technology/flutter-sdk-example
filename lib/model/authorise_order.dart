class AuthoriseOrder {
  String? autoCaptured;
  String? orderExpiryTime;
  String? orderId;
  String? paymentType;
  String? status;

  AuthoriseOrder(
      {this.autoCaptured,
      this.orderExpiryTime,
      this.orderId,
      this.paymentType,
      this.status});

  AuthoriseOrder.fromJson(Map<String, dynamic> json) {
    autoCaptured = json['auto_captured'];
    orderExpiryTime = json['order_expiry_time'];
    orderId = json['order_id'];
    paymentType = json['payment_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auto_captured'] = autoCaptured;
    data['order_expiry_time'] = orderExpiryTime;
    data['order_id'] = orderId;
    data['payment_type'] = paymentType;
    data['status'] = status;
    return data;
  }

  @override
  String toString() {
    return 'AuthoriseOrder('
        'orderId: $orderId, '
        'status: $status, '
        'orderExpiryTime: $orderExpiryTime, '
        'paymentType: $paymentType, '
        'autoCaptured: $autoCaptured'
        ')';
  }
}
