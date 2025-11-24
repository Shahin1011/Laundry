class OrderSummary {
  final String id;
  final String status;
  final num price;
  final String orderId;
  final DateTime updatedAt;

  OrderSummary({
    required this.id,
    required this.status,
    required this.price,
    required this.orderId,
    required this.updatedAt,
  });

  factory OrderSummary.fromJson(Map<String, dynamic> json) {
    num totalPrice = 0;

    if (json['items'] != null && json['items'] is List) {
      for (var item in json['items']) {
        totalPrice += (item['price'] ?? 0);
      }
    }

    return OrderSummary(
      id: json['_id'] ?? '',
      status: json['status'] ?? '',
      price: totalPrice,
      orderId: json['orderId'] ?? '',
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }
}
