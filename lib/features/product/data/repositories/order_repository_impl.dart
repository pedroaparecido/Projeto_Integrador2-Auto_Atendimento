import 'package:dartz/dartz.dart';

import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../data_sources/order_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this._dataSource);

  final OrderDataSource _dataSource;

  @override
  Future<Either<Exception, OrderEntity>> insert(
      {required OrderEntity order}) async {
    try {
      final res = await _dataSource.insert(order: order);
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possível inserir o pedido\nERRO: $err'));
    }
  }

  @override
  Future<Either<Exception, List<OrderEntity>>> getByStatus(int status) async {
    try {
      final res = await _dataSource.getByStatus(status);
      return Right(res);
    } catch (err) {
      return Left(Exception(
          'Não foi possível buscar os pedidos por estado\nERRO: $err'));
    }
  }
}
