import 'package:hasura_connect/hasura_connect.dart';

abstract class GraphqlService {
  Future queryGql({required String query});
  Future mutationGql({required String mutationQuery});
}

class GraphqlServiceImpl implements GraphqlService {
  String urlBase = 'http://18.220.63.252:9001/v1/graphql';
  static const _timeOut = Duration(seconds: 3);

  Future<HasuraConnect> _hasuraConnect() async {
    var hasuraConnect = HasuraConnect(
      urlBase,
      headers: {
        'content-type': 'application/json',
        'x-hasura-admin-secret': 'Univesp!23456789',
      },
    );

    return hasuraConnect;
  }

  @override
  Future mutationGql({required String mutationQuery}) async {
    final connection = await _hasuraConnect().timeout(_timeOut);
    final res = await connection.mutation(mutationQuery);
    return res['data'];
  }

  @override
  Future queryGql({required String query}) async {
    final connection = await _hasuraConnect().timeout(_timeOut);
    final res = await connection.query(query);
    return res['data'];
  }
}
