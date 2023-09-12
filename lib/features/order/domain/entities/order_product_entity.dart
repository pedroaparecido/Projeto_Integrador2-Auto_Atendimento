class OrderProductEntity {
  OrderProductEntity({
    required this.productId,
    required this.quantity
  });

  int productId;
  int quantity;

  @override
  String toString() {
    return 'OrderProductEntity(id: $productId, quantity: $quantity)';
  }
}
