class OrderEntity {
  OrderEntity({
    this.id,
    //required this.products,
    required this.total,
  });

  int? id;
  //List<ProductEntity> products;
  double total;

  @override
  String toString() {
    return 'OrderEntity(id: $id, total: $total)';
  }
}
