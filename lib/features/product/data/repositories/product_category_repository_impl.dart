import 'dart:typed_data';

import 'package:atendimento_automatico/features/product/domain/entities/product_category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:atendimento_automatico/features/product/domain/repositories/product_category_repository.dart';

import '../data_sources/product_category_data_source.dart';

class ProductCategoryRepositoryImpl implements ProductCategoryRepository {
  ProductCategoryRepositoryImpl(this._dataSource);

  final ProductCategoryDataSource _dataSource;

  @override
  Future<bool> delete(int id) async {
    try {
      final res = await _dataSource.delete(id);
      return res;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<Either<Exception, List<ProductCategoryEntity>>> getAll() async {
    try {
      final res = await _dataSource.getAll();
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possivel buscar categorias\nError: $err'));
    }
  }

  @override
  Future<Either<Exception, ProductCategoryEntity>> insert(
      {required String name, required Uint8List image}) async {
    try {
      final res = await _dataSource.insert(name: name, image: image);
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possivel inserir categoria\nError: $err'));
    }
  }

  @override
  Future<Either<Exception, ProductCategoryEntity>> update(
      {required ProductCategoryEntity category}) async {
    try {
      final res = await _dataSource.update(category: category);
      return Right(res);
    } catch (err) {
      return Left(
          Exception('Não foi possivel atualizar categoria\nError: $err'));
    }
  }
}
