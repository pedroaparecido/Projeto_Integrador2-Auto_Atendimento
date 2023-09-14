import 'dart:convert';

import 'package:atendimento_automatico/core/services/image_service.dart';
import 'package:atendimento_automatico/service_locator.dart';

import '../../domain/entities/product_category_entity.dart';

class ProductCategoryModel extends ProductCategoryEntity {
  ProductCategoryModel({
    super.id,
    required super.name,
    required super.image
  });

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    final imageService = sl<ImageService>();

    return ProductCategoryModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      image: imageService.decoderImage(map['image']) ?? null!
    );
  }

  factory ProductCategoryModel.fromJson(String source) => ProductCategoryModel.fromMap(json.decode(source));

  static List<ProductCategoryModel> fromListMap(dynamic listMap) {
    return List<ProductCategoryModel>.from(listMap.map((x) => ProductCategoryModel.fromMap(x)));
  }
}
