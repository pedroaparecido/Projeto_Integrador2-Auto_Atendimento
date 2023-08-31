class BannersGqlModel {
  static String get() => '''query {
    banner {
      id
      image
    }}''';

  static String insert(String image) => '''mutation {
  insert_banner(
          objects: {image: "$image"}) 
          {
          returning {
            id
            image
          }
        }}''';

  static String delete(int id) => '''mutation {
  delete_banner(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }''';
}
