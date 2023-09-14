import '../../domain/entities/product_category_entity.dart';

class ProductCategoryGqlModel {
  static String get() => '''query {
    product_category {
      id
      name
    }
}''';

  static String insert(String name) => '''mutation {
  insert_product_category(
    objects: {
      name: "$name",
      }) 
    {
    returning {
      id
      name
    }
  }
}''';

  static String update(ProductCategoryEntity category) => '''mutation  {
  update_product_category(
    where: {
      id: {_eq: ${category.id}}}, 
      _set: {
        name: "${category.name}"
        }) {
    returning {
      id
      name
    }
  }
}''';

  static String delete(int id) => '''mutation {
  delete_product_category(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }''';
}
