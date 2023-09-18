import 'dart:typed_data';

import '../../../../core/services/graphql_service.dart';
import '../../domain/entities/product_category_entity.dart';
import '../model/product_category_gql_model.dart';
import '../model/product_category_model.dart';

abstract class ProductCategoryDataSource {
  Future<ProductCategoryEntity> insert(
      {required String name, required Uint8List image});
  Future<ProductCategoryEntity> update(
      {required ProductCategoryEntity category});
  Future<bool> delete(int id);
  Future<List<ProductCategoryEntity>> getAll();
}

class ProductCategoryDataSourceImpl implements ProductCategoryDataSource {
  ProductCategoryDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<bool> delete(int id) async {
    final res = await _graphqlService.mutationGql(
        mutationQuery: ProductCategoryGqlModel.delete(id));

    if (res['delete_product_category']['affected_rows'] == 1) return true;
    return false;
  }

  @override
  Future<List<ProductCategoryEntity>> getAll() async {
    final res =
        await _graphqlService.queryGql(query: ProductCategoryGqlModel.get());

    return ProductCategoryModel.fromListMap(res['product_category']);
  }

  @override
  Future<ProductCategoryEntity> insert(
      {required String name, required Uint8List image}) async {
    final res = await _graphqlService.mutationGql(
        mutationQuery: ProductCategoryGqlModel().insert(name, image));

    return ProductCategoryModel.fromMap(
        res['insert_product_category']['returning'][0]);
  }

  @override
  Future<ProductCategoryEntity> update(
      {required ProductCategoryEntity category}) async {
    final res = await _graphqlService.mutationGql(
        mutationQuery: ProductCategoryGqlModel.update(category));

    return ProductCategoryModel.fromMap(
        res['update_product_category']['returning'][0]);
  }
}
