import '../../../order/domain/entities/order_entity.dart';

class OrderGqlModel {
  static String orderQuery = '''
            id
            total''';

  static String get({int? status}) {
    final whereByStatus = status != null && status != 999 ? 'where: {status: {_eq: $status}},' : '';

    return '''query {
          order(
          $whereByStatus 
          order_by: {id: desc}
          ){
            $orderQuery
          }
        }''';
  }

  String insert(OrderEntity order) =>
      '''mutation {
  insert_order(
    objects: {
      total: ${order.total}
    }) {
    returning {
      $orderQuery
    }
  }
}''';

  String insertProducts(int orderId, OrderEntity order) =>
      '''mutation {
  insert_order_product(
    objects: [
      ${order.products.map((product) => '{order_id: $orderId, product_id: ${product.productId}, quantity: ${product.quantity}}').join(', ')}
    ]) {
    returning {
      order_id
      product_id
    }
  }
}''';
}
