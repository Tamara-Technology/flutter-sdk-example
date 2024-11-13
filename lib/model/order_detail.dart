class OrderDetail {
  @override
  String toString() {
    return 'OrderDetail('
        'billingAddress=$billingAddress, \n'
        'consumer=$consumer, \n'
        'countryCode=$countryCode, \n'
        'status=$status, \n'
        'discountAmount=$discountAmount, \n'
        'items=$items, \n'
        'canceledAmount=$canceledAmount, \n'
        'capturedAmount=$capturedAmount, \n'
        'createdAt=$createdAt, \n'
        'description=$description, \n'
        'instalments=$instalments, \n'
        'orderId=$orderId, \n'
        'orderNumber=$orderNumber, \n'
        'orderReferenceId=$orderReferenceId, \n'
        'paymentType=$paymentType, \n'
        'platform=$platform, \n'
        'refundedAmount=$refundedAmount, \n'
        'settlementStatus=$settlementStatus, \n'
        'shippingAddress=$shippingAddress, \n'
        'shippingAmount=$shippingAmount, \n'
        'taxAmount=$taxAmount, \n'
        'totalAmount=$totalAmount, \n'
        'walletPrepaidAmount=$walletPrepaidAmount'
        ')';
  }

  BillingAddress? billingAddress;
  CanceledAmount? canceledAmount;
  CanceledAmount? capturedAmount;
  Consumer? consumer;
  String? countryCode;
  String? createdAt;
  String? description;
  CanceledAmount? discountAmount;
  int? instalments;
  List<Items>? items;
  String? orderId;
  String? orderNumber;
  String? orderReferenceId;
  CanceledAmount? paidAmount;
  String? paymentType;
  String? platform;
  CanceledAmount? refundedAmount;
  String? settlementStatus;
  BillingAddress? shippingAddress;
  CanceledAmount? shippingAmount;
  String? status;
  CanceledAmount? taxAmount;
  CanceledAmount? totalAmount;
  CanceledAmount? walletPrepaidAmount;

  OrderDetail(
      {billingAddress,
      canceledAmount,
      capturedAmount,
      consumer,
      countryCode,
      createdAt,
      description,
      discountAmount,
      instalments,
      items,
      orderId,
      orderNumber,
      orderReferenceId,
      paidAmount,
      paymentType,
      platform,
      refundedAmount,
      settlementStatus,
      shippingAddress,
      shippingAmount,
      status,
      taxAmount,
      totalAmount,
      walletPrepaidAmount});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    billingAddress = json['billing_address'] != null
        ? BillingAddress.fromJson(json['billing_address'])
        : null;
    canceledAmount = json['canceled_amount'] != null
        ? CanceledAmount.fromJson(json['canceled_amount'])
        : null;
    capturedAmount = json['captured_amount'] != null
        ? CanceledAmount.fromJson(json['captured_amount'])
        : null;
    consumer =
        json['consumer'] != null ? Consumer.fromJson(json['consumer']) : null;
    countryCode = json['country_code'];
    createdAt = json['created_at'];
    description = json['description'];
    discountAmount = json['discount_amount'] != null
        ? CanceledAmount.fromJson(json['discount_amount'])
        : null;
    instalments = json['instalments'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    orderId = json['order_id'];
    orderNumber = json['order_number'];
    orderReferenceId = json['order_reference_id'];
    paidAmount = json['paid_amount'] != null
        ? CanceledAmount.fromJson(json['paid_amount'])
        : null;
    paymentType = json['payment_type'];
    platform = json['platform'];
    refundedAmount = json['refunded_amount'] != null
        ? CanceledAmount.fromJson(json['refunded_amount'])
        : null;
    settlementStatus = json['settlement_status'];
    shippingAddress = json['shipping_address'] != null
        ? BillingAddress.fromJson(json['shipping_address'])
        : null;
    shippingAmount = json['shipping_amount'] != null
        ? CanceledAmount.fromJson(json['shipping_amount'])
        : null;
    status = json['status'];
    taxAmount = json['tax_amount'] != null
        ? CanceledAmount.fromJson(json['tax_amount'])
        : null;
    totalAmount = json['total_amount'] != null
        ? CanceledAmount.fromJson(json['total_amount'])
        : null;
    walletPrepaidAmount = json['wallet_prepaid_amount'] != null
        ? CanceledAmount.fromJson(json['wallet_prepaid_amount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (billingAddress != null) {
      data['billing_address'] = billingAddress!.toJson();
    }
    if (canceledAmount != null) {
      data['canceled_amount'] = canceledAmount!.toJson();
    }
    if (capturedAmount != null) {
      data['captured_amount'] = capturedAmount!.toJson();
    }
    if (consumer != null) {
      data['consumer'] = consumer!.toJson();
    }
    data['country_code'] = countryCode;
    data['created_at'] = createdAt;
    data['description'] = description;
    if (discountAmount != null) {
      data['discount_amount'] = discountAmount!.toJson();
    }
    data['instalments'] = instalments;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['order_id'] = orderId;
    data['order_number'] = orderNumber;
    data['order_reference_id'] = orderReferenceId;
    if (paidAmount != null) {
      data['paid_amount'] = paidAmount!.toJson();
    }
    data['payment_type'] = paymentType;
    data['platform'] = platform;
    if (refundedAmount != null) {
      data['refunded_amount'] = refundedAmount!.toJson();
    }
    data['settlement_status'] = settlementStatus;
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    if (shippingAmount != null) {
      data['shipping_amount'] = shippingAmount!.toJson();
    }
    data['status'] = status;
    if (taxAmount != null) {
      data['tax_amount'] = taxAmount!.toJson();
    }
    if (totalAmount != null) {
      data['total_amount'] = totalAmount!.toJson();
    }
    if (walletPrepaidAmount != null) {
      data['wallet_prepaid_amount'] = walletPrepaidAmount!.toJson();
    }
    return data;
  }
}

class BillingAddress {
  @override
  String toString() {
    return 'BillingAddress('
        'city=$city, '
        'countryCode=$countryCode, '
        'firstName=$firstName, '
        'lastName=$lastName, '
        'line1=$line1, '
        'line2=$line2, '
        'phoneNumber=$phoneNumber, '
        'region=$region'
        ')';
  }

  String? city;
  String? countryCode;
  String? firstName;
  String? lastName;
  String? line1;
  String? line2;
  String? phoneNumber;
  String? region;

  BillingAddress(
      {city,
      countryCode,
      firstName,
      lastName,
      line1,
      line2,
      phoneNumber,
      region});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    countryCode = json['country_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    line1 = json['line1'];
    line2 = json['line2'];
    phoneNumber = json['phone_number'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['country_code'] = countryCode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['line1'] = line1;
    data['line2'] = line2;
    data['phone_number'] = phoneNumber;
    data['region'] = region;
    return data;
  }
}

class CanceledAmount {
  @override
  String toString() {
    return 'CanceledAmount('
        'amount=$amount, '
        'currency=$currency'
        ')';
  }

  double? amount;
  String? currency;

  CanceledAmount({amount, currency});

  CanceledAmount.fromJson(Map<String, dynamic> json) {
    amount = double.tryParse(json['amount'].toString());
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

class Consumer {
  @override
  String toString() {
    return 'Consumer('
        'dateOfBirth=$dateOfBirth, '
        'email=$email, '
        'firstName=$firstName, '
        'isFirstOrder=$isFirstOrder, '
        'lastName=$lastName, '
        'nationalId=$nationalId, '
        'phoneNumber=$phoneNumber'
        ')';
  }

  String? dateOfBirth;
  String? email;
  String? firstName;
  bool? isFirstOrder;
  String? lastName;
  String? nationalId;
  String? phoneNumber;

  Consumer(
      {dateOfBirth,
      email,
      firstName,
      isFirstOrder,
      lastName,
      nationalId,
      phoneNumber});

  Consumer.fromJson(Map<String, dynamic> json) {
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    firstName = json['first_name'];
    isFirstOrder = json['is_first_order'];
    lastName = json['last_name'];
    nationalId = json['national_id'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date_of_birth'] = dateOfBirth;
    data['email'] = email;
    data['first_name'] = firstName;
    data['is_first_order'] = isFirstOrder;
    data['last_name'] = lastName;
    data['national_id'] = nationalId;
    data['phone_number'] = phoneNumber;
    return data;
  }
}

class DiscountAmount {
  @override
  String toString() {
    return 'DiscountAmount(amount=$amount'
        ' name=$name)';
  }

  CanceledAmount? amount;
  String? name;

  DiscountAmount({amount, name});

  DiscountAmount.fromJson(Map<String, dynamic> json) {
    amount =
        json['amount'] != null ? CanceledAmount.fromJson(json['amount']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class Items {
  @override
  String toString() {
    return 'Items(discountAmount=$discountAmount,'
        ' imageUrl=$imageUrl, '
        ' itemUrl=$itemUrl,'
        ' name=$name,'
        ' quantity=$quantity,'
        ' referenceId=$referenceId,'
        ' sku=$sku,'
        ' taxAmount=$taxAmount,'
        ' totalAmount=$totalAmount,'
        ' unitPrice=$unitPrice)';
  }

  CanceledAmount? discountAmount;
  String? imageUrl;
  String? itemUrl;
  String? name;
  int? quantity;
  String? referenceId;
  String? sku;
  CanceledAmount? taxAmount;
  CanceledAmount? totalAmount;
  CanceledAmount? unitPrice;

  Items(
      {discountAmount,
      imageUrl,
      itemUrl,
      name,
      quantity,
      referenceId,
      sku,
      taxAmount,
      totalAmount,
      unitPrice});

  Items.fromJson(Map<String, dynamic> json) {
    discountAmount = json['discount_amount'] != null
        ? CanceledAmount.fromJson(json['discount_amount'])
        : null;
    imageUrl = json['image_url'];
    itemUrl = json['item_url'];
    name = json['name'];
    quantity = json['quantity'];
    referenceId = json['reference_id'];
    sku = json['sku'];
    taxAmount = json['tax_amount'] != null
        ? CanceledAmount.fromJson(json['tax_amount'])
        : null;
    totalAmount = json['total_amount'] != null
        ? CanceledAmount.fromJson(json['total_amount'])
        : null;
    unitPrice = json['unit_price'] != null
        ? CanceledAmount.fromJson(json['unit_price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (discountAmount != null) {
      data['discount_amount'] = discountAmount!.toJson();
    }
    data['image_url'] = imageUrl;
    data['item_url'] = itemUrl;
    data['name'] = name;
    data['quantity'] = quantity;
    data['reference_id'] = referenceId;
    data['sku'] = sku;
    if (taxAmount != null) {
      data['tax_amount'] = taxAmount!.toJson();
    }
    if (totalAmount != null) {
      data['total_amount'] = totalAmount!.toJson();
    }
    if (unitPrice != null) {
      data['unit_price'] = unitPrice!.toJson();
    }
    return data;
  }
}

class Checkout {
  @override
  String toString() {
    return 'Checkout('
        'checkout_url=$checkout_url, '
        'order_id=$order_id'
        ')';
  }

  String? checkout_url;
  String? order_id;

  Checkout({checkout_url, order_id});

  Checkout.fromJson(Map<String, dynamic> json) {
    checkout_url = json['checkout_url'];
    order_id = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['checkout_url'] = checkout_url;
    data['order_id'] = order_id;
    return data;
  }
}
