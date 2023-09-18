import 'dart:typed_data';

import 'package:atendimento_automatico/core/services/image_service.dart';
import 'package:atendimento_automatico/service_locator.dart';

import '../../domain/entities/product_category_entity.dart';

class ProductCategoryGqlModel {
  final _imageService = sl<ImageService>();

  static String get() => '''query {
    product_category {
      id
      name
      image
    }
}''';

  String insert(String name, Uint8List image) => '''mutation {
  insert_product_category(
    objects: {
      name: "$name",
      image: "${_imageService.encoderImage(image)}"
      }) 
    {
    returning {
      id
      name
      image
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
