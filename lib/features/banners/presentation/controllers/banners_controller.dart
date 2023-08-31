import 'dart:async';
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/dialog_widget.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/banners_entity.dart';
import '../../domain/repositories/banners_repository.dart';

class BannersController extends GetxController {
  final _bannersRepository = sl<BannersRepository>();
  final _imageService = sl<ImageService>();

  final isLoading = false.obs;
  final banners = <BannersEntity>[].obs;
  BannersEntity? banner;
  Uint8List? imageFileSelected;

  @override
  void onInit() async {
    await getAllBanners();
    super.onInit();
  }

  Future<void> getLocalImage() async {
    isLoading.value = true;

    imageFileSelected = await _imageService.getImage();

    isLoading.value = false;
  }

  Future<void> insertBanner() async {
    if (imageFileSelected == null) {
      DialogWidget.feedback(result: false, message: 'Selecione uma imagem.');
      return;
    }

    isLoading.value = true;
    final res = await _bannersRepository.insert(image: _imageService.encoderImage(imageFileSelected!));
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) {
        banners.add(r);
        imageFileSelected = null;
        Get.back();
      },
    );
    isLoading.value = false;
  }

  Future<void> getAllBanners() async {
    isLoading.value = true;

    final res = await _bannersRepository.getAll();
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => banners.assignAll(r),
    );

    isLoading.value = false;
  }

  Future<void> deleteBanner(int id) async {
    isLoading.value = true;
    final res = await _bannersRepository.delete(id);

    if (res) {
      isLoading.value = false;
      banners.removeWhere((element) => element.id == id);
      DialogWidget.feedback(result: true, message: 'Imagem deletada com sucesso');
    } else {
      isLoading.value = false;
      DialogWidget.feedback(result: false, message: 'Erro ao deletar imagem');
    }
  }
}
