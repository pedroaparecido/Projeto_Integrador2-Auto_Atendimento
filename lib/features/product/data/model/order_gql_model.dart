import '../../domain/entities/order_entity.dart';

class OrderGqlModel {
  static String orderQuery = '''
            id
            total''';

  static String get({int? status}) {
    final whereByStatus = status != null && status != 999
        ? 'where: {status: {_eq: $status}},'
        : '';

    return '''query {
          order(
          $whereByStatus 
          order_by: {id: desc}
          ){
            $orderQuery
          }
        }''';
  }

  String insert(OrderEntity order) => '''mutation {
  insert_order(
    objects: {
      total: ${order.total}
    }) {
    returning {
      $orderQuery
    }
  }
}''';
}
