class OrderDetailsModel {
  bool? success;
  int? status;
  String? message;
  OrderData? data;

  OrderDetailsModel({this.success, this.status, this.message, this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? OrderData.fromJson(json['data']) : null;
  }
}

class OrderData {
  CustomerProfile? customerProfile;
  Order? order;

  OrderData({this.customerProfile, this.order});

  OrderData.fromJson(Map<String, dynamic> json) {
    customerProfile = json['customerProfile'] != null
        ? CustomerProfile.fromJson(json['customerProfile'])
        : null;
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
}

class CustomerProfile {
  String? name;
  String? email;
  String? phone;

  CustomerProfile({this.name, this.email, this.phone});

  CustomerProfile.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
  }
}

class Order {
  String? id;
  String? customer;
  String? serviceType;
  String? platform;
  Address? address;
  List<Item>? items;
  int? total;
  String? status;
  String? pickupDate;
  String? dropoffDate;
  String? paymentMethod;
  PaymentId? paymentId;
  String? orderId;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
        this.customer,
        this.serviceType,
        this.platform,
        this.address,
        this.items,
        this.total,
        this.status,
        this.pickupDate,
        this.dropoffDate,
        this.paymentMethod,
        this.paymentId,
        this.orderId,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    customer = json['customer'];
    serviceType = json['serviceType'];
    platform = json['platform'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;

    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) => items!.add(Item.fromJson(v)));
    }

    total = json['total'];
    status = json['status'];
    pickupDate = json['pickupDate'];
    dropoffDate = json['dropoffDate'];
    paymentMethod = json['paymentMethod'];
    paymentId =
    json['paymentId'] != null ? PaymentId.fromJson(json['paymentId']) : null;
    orderId = json['orderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? zipCode;

  Address({this.street, this.city, this.state, this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
  }
}

class Item {
  String? name;
  int? quantity;
  int? price;
  String? id;

  Item({this.name, this.quantity, this.price, this.id});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    id = json['_id'];
  }
}

class PaymentId {
  String? id;
  String? orderId;
  String? userId;
  String? method;
  int? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? v;

  PaymentId(
      {this.id,
        this.orderId,
        this.userId,
        this.method,
        this.amount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.v});

  PaymentId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    orderId = json['orderId'];
    userId = json['userId'];
    method = json['method'];
    amount = json['amount'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}
