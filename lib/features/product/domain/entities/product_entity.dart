import 'dart:typed_data';

import 'product_category_entity.dart';

class ProductEntity {
  ProductEntity({
    this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  int? id;
  ProductCategoryEntity category;
  String name;
  double price;
  String description;
  Uint8List image;

  @override
  String toString() {
    return 'ProductEntity(id: $id, category: $category, name: $name, detail: $description, price: $price)';
  }
}
