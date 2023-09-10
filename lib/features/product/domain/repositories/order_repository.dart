import 'package:dartz/dartz.dart';

import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Exception, OrderEntity>> insert({required OrderEntity order});
  Future<Either<Exception, List<OrderEntity>>> getByStatus(int status);
}
