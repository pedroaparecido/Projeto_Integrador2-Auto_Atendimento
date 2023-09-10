import 'package:atendimento_automatico/features/product/domain/entities/order_product_entity.dart';

class OrderEntity {
  OrderEntity({
    this.id,
    required this.products,
    required this.total,
  });

  int? id;
  List<OrderProductEntity> products;
  double total;

  @override
  String toString() {
    return 'OrderEntity(id: $id, total: $total, products: $products)';
  }
}
