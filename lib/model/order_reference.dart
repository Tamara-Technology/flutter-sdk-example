class OrderReference {
  String? message;

  OrderReference({
    this.message,
  });

  OrderReference.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }

  @override
  String toString() {
    return 'OrderReference{message: $message}';
  }
}
