class OrderSummary {
  final bool? success;
  final int? status;
  final String? message;
  final SummaryData? data;

  OrderSummary({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory OrderSummary.fromJson(Map<String, dynamic> json) {
    return OrderSummary(
      success: json['success'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? SummaryData.fromJson(json['data']) : null,
    );
  }
}

class SummaryData {
  final List<Order>? orders;

  SummaryData({this.orders});

  factory SummaryData.fromJson(Map<String, dynamic> json) {
    return SummaryData(
      orders: json['orders'] != null
          ? (json['orders'] as List)
          .map((item) => Order.fromJson(item))
          .toList()
          : null,
    );
  }
}

// ========================== ORDER ===============================

class Order {
  final Address? address;
  final String? id;
  final String? customer;
  final String? serviceType;
  final String? platform;
  final List<OrderItem>? items;
  final int? total;
  final String? status;
  final String? pickupDate;
  final String? dropoffDate;
  final String? paymentMethod;
  final PaymentInfo? paymentId;
  final String? orderId;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  final List<dynamic>? timeline;

  Order({
    this.address,
    this.id,
    this.customer,
    this.serviceType,
    this.platform,
    this.items,
    this.total,
    this.status,
    this.pickupDate,
    this.dropoffDate,
    this.paymentMethod,
    this.paymentId,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.timeline,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      address:
      json['address'] != null ? Address.fromJson(json['address']) : null,
      id: json['_id'],
      customer: json['customer'],
      serviceType: json['serviceType'],
      platform: json['platform'],

      items: json['items'] != null
          ? (json['items'] as List)
          .map((i) => OrderItem.fromJson(i))
          .toList()
          : null,

      total: json['total'],
      status: json['status'],
      pickupDate: json['pickupDate'],
      dropoffDate: json['dropoffDate'],
      paymentMethod: json['paymentMethod'],

      paymentId:
      json['paymentId'] != null ? PaymentInfo.fromJson(json['paymentId']) : null,

      orderId: json['orderId'],

      createdAt:
      json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,

      updatedAt:
      json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,

      v: json['__v'],

      timeline: json['timeline'] != null ? List.from(json['timeline']) : [],
    );
  }
}

// ========================== ADDRESS ===============================

class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;

  Address({this.street, this.city, this.state, this.zipCode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
    );
  }
}

// ========================== ORDER ITEM ===============================

class OrderItem {
  final String? id;
  final String? name;
  final int? quantity;
  final int? price;

  OrderItem({
    this.id,
    this.name,
    this.quantity,
    this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['_id'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}

// ========================== PAYMENT INFO ===============================

class PaymentInfo {
  final String? id;
  final String? orderId;
  final String? userId;
  final String? method;
  final int? amount;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  PaymentInfo({
    this.id,
    this.orderId,
    this.userId,
    this.method,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) {
    return PaymentInfo(
      id: json['_id'],
      orderId: json['orderId'],
      userId: json['userId'],
      method: json['method'],
      amount: json['amount'],
      status: json['status'],
      createdAt:
      json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
      json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'],
    );
  }
}
