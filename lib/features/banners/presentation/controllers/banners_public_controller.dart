import 'dart:async';

import 'package:get/get.dart';

import '../../../../service_locator.dart';
import '../../domain/entities/banners_entity.dart';
import '../../domain/repositories/banners_repository.dart';

class BannersPublicController extends GetxController {
  final _bannersRepository = sl<BannersRepository>();

  final isLoading = false.obs;
  final banners = <BannersEntity>[].obs;

  bool isError = false;

  @override
  void onInit() async {
    await getAllBanners();
    super.onInit();
  }

  Future<void> getAllBanners() async {
    isLoading.value = true;

    final res = await _bannersRepository.getAll();
    res.fold(
      (l) => isError = true,
      (r) => banners.assignAll(r),
    );

    isLoading.value = false;
  }
}
