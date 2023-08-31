import 'dart:convert';

import '../../../../core/services/image_service.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/product_entity.dart';
import 'product_category_model.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    required super.category,
    required super.name,
    required super.description,
    required super.price,
    required super.image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    final imageService = sl<ImageService>();

    return ProductModel(
      id: map['id'] as int,
      category: ProductCategoryModel.fromMap(map['product_category']),
      name: map['name'],
      description: map['description'],
      price: map['price'] * 1.0,
      image: imageService.decoderImage(map['image']),
    );
  }

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  static List<ProductModel> fromListMap(dynamic listMap) {
    return List<ProductModel>.from(listMap.map((x) => ProductModel.fromMap(x)));
  }
}
