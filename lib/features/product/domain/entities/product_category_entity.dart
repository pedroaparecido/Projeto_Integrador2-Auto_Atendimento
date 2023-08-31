class ProductCategoryEntity {
  ProductCategoryEntity({
    this.id,
    required this.name,
  });

  final int? id;
  final String name;

  @override
  String toString() => 'ProductCategoryEntity(id: $id, name: $name)';
}
