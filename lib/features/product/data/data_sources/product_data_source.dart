import '../../../../core/services/graphql_service.dart';
import '../../domain/entities/product_entity.dart';
import '../model/product_gql_model.dart';
import '../model/product_model.dart';

abstract class ProductDataSource {
  Future<ProductEntity> insert({required ProductEntity product});
  Future<ProductEntity> update({required ProductEntity product});
  Future<bool> delete(int id);
  Future<List<ProductEntity>> getAll();
  Future<List<ProductEntity>> getByCategory(int idCategory);
}

class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<bool> delete(int id) async {
    final res = await _graphqlService.mutationGql(mutationQuery: ProductGqlModel.delete(id));

    if (res['delete_product']['affected_rows'] == 1) return true;
    return false;
  }

  @override
  Future<List<ProductEntity>> getAll() async {
    final res = await _graphqlService.queryGql(query: ProductGqlModel.get());

    return ProductModel.fromListMap(res['product']);
  }

  @override
  Future<List<ProductEntity>> getByCategory(int idCategory) async {
    final res = await _graphqlService.queryGql(query: ProductGqlModel.get(idCategory: idCategory));

    return ProductModel.fromListMap(res['product']);
  }

  @override
  Future<ProductEntity> insert({required ProductEntity product}) async {
    final res = await _graphqlService.mutationGql(mutationQuery: ProductGqlModel().insert(product));

    return ProductModel.fromMap(res['insert_product']['returning'][0]);
  }

  @override
  Future<ProductEntity> update({required ProductEntity product}) async {
    final res = await _graphqlService.mutationGql(mutationQuery: ProductGqlModel().update(product));

    return ProductModel.fromMap(res['update_product']['returning'][0]);
  }
}
