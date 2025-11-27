class ChoicePackageModel {
  bool? success;
  int? status;
  String? message;
  List<PackageData>? data;

  ChoicePackageModel({this.success, this.status, this.message, this.data});

  ChoicePackageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PackageData>[];
      json['data'].forEach((v) {
        data!.add(PackageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'status': status,
    'message': message,
    'data': data?.map((v) => v.toJson()).toList(),
  };
}

class PackageData {
  String? image;
  String? deliveryTime;
  String? id;
  String? packageName; // now just String
  Prices? prices;      // NEW: store small, medium, large here
  String? categoryId;
  String? description;
  String? packageImage;
  String? estimatedDeliveryTime;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  PackageData({
    this.image,
    this.deliveryTime,
    this.id,
    this.packageName,
    this.prices,
    this.categoryId,
    this.description,
    this.packageImage,
    this.estimatedDeliveryTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  PackageData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    deliveryTime = json['deliveryTime'];
    id = json['_id'];
    packageName = json['packageName'];
    prices = json['prices'] != null ? Prices.fromJson(json['prices']) : null;
    categoryId = json['categoryId'];
    description = json['description'];
    packageImage = json['packageImage'];
    estimatedDeliveryTime = json['estimatedDeliveryTime'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() => {
    'image': image,
    'deliveryTime': deliveryTime,
    '_id': id,
    'packageName': packageName,
    'prices': prices?.toJson(),
    'categoryId': categoryId,
    'description': description,
    'packageImage': packageImage,
    'estimatedDeliveryTime': estimatedDeliveryTime,
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}

class Prices {
  int? small;
  int? medium;
  int? large;

  Prices({this.small, this.medium, this.large});

  Prices.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() => {
    'small': small,
    'medium': medium,
    'large': large,
  };
}
