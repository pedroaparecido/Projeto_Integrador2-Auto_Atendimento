import 'dart:typed_data';

class ProductCategoryEntity {
  ProductCategoryEntity({this.id, required this.name, required this.image});

  final int? id;
  final String name;
  final Uint8List image;

  @override
  String toString() => 'ProductCategoryEntity(id: $id, name: $name)';
}
