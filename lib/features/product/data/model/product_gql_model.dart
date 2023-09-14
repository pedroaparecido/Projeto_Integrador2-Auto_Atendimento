import '../../../../core/services/image_service.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/product_entity.dart';

class ProductGqlModel {
  final _imageService = sl<ImageService>();
  static String productQuery = '''
            id
            product_category {
              id
              name
              image
            }
            name
            description
            price
            image''';

  static String get({int? idCategory}) {
    final whereByCategory =
        idCategory != null && idCategory != 999 ? 'where: {product_category_id: {_eq: $idCategory}},' : '';

    return '''query {
          product(
          $whereByCategory 
          order_by: {id: desc}
          ){
            $productQuery
          }
        }''';
  }

  String insert(ProductEntity product) => '''mutation {
  insert_product(
    objects: {
      product_category_id: ${product.category.id}, 
      name: "${product.name}", 
      description: "${product.description}", 
      price: "${product.price}", 
      image: "${_imageService.encoderImage(product.image)}"
    }) {
    returning {
      $productQuery
    }
  }
}''';

  String update(ProductEntity product) => '''mutation  {
  update_product(
      where: {
      id: {_eq: ${product.id}}}, 
    _set: {
      product_category_id: ${product.category.id}, 
      name: "${product.name}", 
      price: "${product.price}", 
      description: "${product.description}", 
      image: "${_imageService.encoderImage(product.image)}"
    }) {
    returning {
      $productQuery
    }
  }
}''';

  static String delete(int id) => '''mutation {
  delete_product(where: {id: {_eq: $id}}) {
          affected_rows
        }
      }''';
}
