import 'package:atendimento_automatico/features/order/domain/entities/order_product_entity.dart';

class OrderEntity {
  OrderEntity({
    this.id,
    required this.products,
    required this.total,
  });

  int? id;
  List<OrderProductEntity> products;

  double total; // transformar metodo que pega a lista e retorna o total

  @override
  String toString() {
    return 'OrderEntity(id: $id, total: $total, products: $products)';
  }
}
