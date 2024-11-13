class ShippingInfo {
  String? shippedAt;
  String? shippingCompany;
  String? trackingNumber;
  String? trackingUrl;

  ShippingInfo({
    this.shippedAt,
    this.shippingCompany,
    this.trackingNumber,
    this.trackingUrl,
  });

  ShippingInfo.fromJson(Map<String, dynamic> json) {
    shippedAt = json['shipped_at'];
    shippingCompany = json['shipping_company'];
    trackingNumber = json['tracking_number'];
    trackingUrl = json['tracking_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shipped_at'] = shippedAt;
    data['shipping_company'] = shippingCompany;
    data['tracking_number'] = trackingNumber;
    data['tracking_url'] = trackingUrl;
    return data;
  }

  @override
  String toString() {
    return 'ShippingInfo{shippedAt: $shippedAt, shippingCompany: $shippingCompany, trackingNumber: $trackingNumber, trackingUrl: $trackingUrl}';
  }
}
