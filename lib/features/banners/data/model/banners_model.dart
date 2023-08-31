import 'dart:convert';

import '../../../../core/services/image_service.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/banners_entity.dart';

class BannersModel extends BannersEntity {
  BannersModel({
    super.id,
    required super.image,
  });

  factory BannersModel.fromMap(Map<String, dynamic> map) {
    final imageService = sl<ImageService>();

    return BannersModel(
      id: map['id']?.toInt(),
      image: imageService.decoderImage(map['image']),
    );
  }

  factory BannersModel.fromJson(String source) => BannersModel.fromMap(json.decode(source));

  static List<BannersModel> fromListMap(dynamic listMap) {
    return List<BannersModel>.from(listMap.map((x) => BannersModel.fromMap(x)));
  }
}
