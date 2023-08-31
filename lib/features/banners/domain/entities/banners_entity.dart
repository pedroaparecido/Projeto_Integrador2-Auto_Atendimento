import 'dart:typed_data';

class BannersEntity {
  BannersEntity({
    this.id,
    required this.image,
  });

  int? id;
  Uint8List image;

  @override
  String toString() {
    return 'BannersEntity(id: $id,  image: $image)';
  }
}
