import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

abstract class ImageService {
  Future<Uint8List?> getImage();
  Uint8List decoderImage(String base64);
  String encoderImage(Uint8List imageFile);
}

class ImageLocalServiceImpl implements ImageService {
  final imagePicker = ImagePicker();

  @override
  Future<Uint8List?> getImage() async {
    try {
      final result = await imagePicker.pickImage(source: ImageSource.gallery);

      return await result?.readAsBytes();
    } catch (_) {
      return null;
    }
  }

  @override
  Uint8List decoderImage(String source) {
    return base64Decode(source);
  }

  @override
  String encoderImage(Uint8List imageFile) {
    return base64Encode(imageFile);
  }
}
