import 'dart:convert';

import '../../domain/entities/product_category_entity.dart';

class ProductCategoryModel extends ProductCategoryEntity {
  ProductCategoryModel({
    super.id,
    required super.name,
  });

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    return ProductCategoryModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
    );
  }

  factory ProductCategoryModel.fromJson(String source) => ProductCategoryModel.fromMap(json.decode(source));

  static List<ProductCategoryModel> fromListMap(dynamic listMap) {
    return List<ProductCategoryModel>.from(listMap.map((x) => ProductCategoryModel.fromMap(x)));
  }
}
