import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../entities/product_category_entity.dart';

abstract class ProductCategoryRepository {
  Future<Either<Exception, ProductCategoryEntity>> insert(
      {required String name, required Uint8List image});
  Future<Either<Exception, ProductCategoryEntity>> update(
      {required ProductCategoryEntity category});
  Future<bool> delete(int id);
  Future<Either<Exception, List<ProductCategoryEntity>>> getAll();
}
