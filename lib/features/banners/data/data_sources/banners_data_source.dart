import 'dart:async';

import '../../../../core/services/graphql_service.dart';
import '../../domain/entities/banners_entity.dart';
import '../model/banners_gql_model.dart';
import '../model/banners_model.dart';

abstract class BannersDataSource {
  Future<BannersEntity> insert({required String image});
  Future<bool> delete(int id);
  Future<List<BannersEntity>> getAll();
}

class BannersDataSourceImpl implements BannersDataSource {
  final GraphqlService _graphqlService;

  BannersDataSourceImpl(this._graphqlService);

  @override
  Future<bool> delete(int id) async {
    final res = await _graphqlService.mutationGql(mutationQuery: BannersGqlModel.delete(id));

    if (res['delete_banner']['affected_rows'] == 1) return true;
    return false;
  }

  @override
  Future<List<BannersEntity>> getAll() async {
    final res = await _graphqlService.queryGql(query: BannersGqlModel.get());

    return BannersModel.fromListMap(res['banner']);
  }

  @override
  Future<BannersEntity> insert({required String image}) async {
    final res = await _graphqlService.mutationGql(mutationQuery: BannersGqlModel.insert(image));

    return BannersModel.fromMap(res['insert_banner']['returning'][0]);
  }
}
