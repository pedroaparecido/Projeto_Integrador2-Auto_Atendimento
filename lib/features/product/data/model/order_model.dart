import 'dart:convert';

import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    super.id,
    required super.total,
    required super.products
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as int,
      total: map['total'],
      products: []
    );
  }

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  static List<OrderModel> fromListMap(dynamic listMap) {
    return List<OrderModel>.from(listMap.map((x) => OrderModel.fromMap(x)));
  }
}
