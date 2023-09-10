import 'package:atendimento_automatico/features/product/data/model/order_gql_model.dart';
import 'package:atendimento_automatico/features/product/data/model/order_model.dart';
import 'package:atendimento_automatico/features/product/domain/entities/order_entity.dart';

import '../../../../core/services/graphql_service.dart';

abstract class OrderDataSource {
  Future<OrderEntity> insert({required OrderEntity order});
  Future<List<OrderEntity>> getByStatus(int status);
}

class OrderDataSourceImpl implements OrderDataSource {
  OrderDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<List<OrderEntity>> getByStatus(int status) async {
    final res = await _graphqlService.queryGql(
        query: OrderGqlModel.get(status: status));

    return OrderModel.fromListMap(res['order']);
  }

  @override
  Future<OrderEntity> insert({required OrderEntity order}) async {
    final res1 = await _graphqlService.mutationGql(
        mutationQuery: OrderGqlModel().insert(order));

    OrderEntity updatedOrder = OrderModel.fromMap(res1['insert_order']['returning'][0]);

    await _graphqlService.mutationGql(
        mutationQuery: OrderGqlModel().insertProducts(updatedOrder.id!, order));

    return updatedOrder;
  }
}
