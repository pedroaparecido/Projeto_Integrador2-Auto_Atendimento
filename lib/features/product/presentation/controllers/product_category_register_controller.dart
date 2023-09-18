import 'dart:typed_data';

import 'package:atendimento_automatico/core/services/image_service.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/dialog_widget.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/product_category_entity.dart';
import '../../domain/repositories/product_category_repository.dart';

class ProductCategoryRegisterController extends GetxController {
  final _productCategoryRepository = sl<ProductCategoryRepository>();
  final _imageService = sl<ImageService>();

  final isLoading = false.obs;

  final productCategories = <ProductCategoryEntity>[].obs;
  ProductCategoryEntity? productCategory;
  Uint8List? imageFileSelected;

  @override
  void onInit() async {
    await getAllProductCategory();
    super.onInit();
  }

  Future<void> getLocalImage() async {
    isLoading.value = true;

    imageFileSelected = await _imageService.getImage();

    isLoading.value = false;
  }

  Future<void> insertProductCategory(String name) async {
    isLoading.value = true;
    final res = await _productCategoryRepository.insert(name: name);
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) {
        productCategories.add(r);
        Get.back();
      },
    );
    isLoading.value = false;
  }

  Future<void> getAllProductCategory() async {
    isLoading.value = true;
    final res = await _productCategoryRepository.getAll();
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => productCategories.assignAll(r),
    );
    isLoading.value = false;
  }

  Future<void> updateProductCategory(ProductCategoryEntity category) async {
    isLoading.value = true;
    final res = await _productCategoryRepository.update(category: category);
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      // (r) => productCategories.add(r),
      (r) => null,
    );
    isLoading.value = false;
  }

  Future<void> deleteProductCategory(int id) async {
    isLoading.value = true;
    final res = await _productCategoryRepository.delete(id);

    if (res) {
      isLoading.value = false;
      productCategories.removeWhere((element) => element.id == id);
      DialogWidget.feedback(
          result: true, message: 'Categoria deletada com sucesso');
    } else {
      isLoading.value = false;
      DialogWidget.feedback(
          result: false, message: 'Erro ao deletar categoria');
    }
  }
}
