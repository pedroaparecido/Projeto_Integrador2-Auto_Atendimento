import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Exception, ProductEntity>> insert({required ProductEntity product});
  Future<Either<Exception, ProductEntity>> update({required ProductEntity product});
  Future<bool> delete(int id);
  Future<Either<Exception, List<ProductEntity>>> getAll();
  Future<Either<Exception, List<ProductEntity>>> getByCategory(int idCategory);
}
