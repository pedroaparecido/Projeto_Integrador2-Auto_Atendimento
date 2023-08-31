import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/regularize_helper.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/dialog_widget.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/product_category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

class ProductController extends GetxController {
  final _productRepository = sl<ProductRepository>();
  final _imageService = sl<ImageService>();

  final formKey = GlobalKey<FormState>();
  final nameInputController = TextEditingController();
  final descriptionInputController = TextEditingController();
  final priceInputController = TextEditingController();

  final isLoading = false.obs;
  final products = <ProductEntity>[].obs;

  ProductCategoryEntity? productCategory;
  Uint8List? imageFileSelected;

  @override
  void onInit() async {
    await getAllProduct();
    super.onInit();
  }

  void _resetForm() {
    formKey.currentState!.reset();
    imageFileSelected = null;
  }

  void cancelInsert() {
    _resetForm();
    Get.back();
  }

  Future<void> getLocalImage() async {
    isLoading.value = true;

    imageFileSelected = await _imageService.getImage();

    isLoading.value = false;
  }

  void validForm() {
    if (imageFileSelected == null) {
      DialogWidget.feedback(result: false, message: 'Selecione uma imagem.');
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      insertProduct(
        ProductEntity(
          category: productCategory!,
          name: nameInputController.text,
          description: descriptionInputController.text,
          price: RegularizeHelper.stringRealCurrencyToDouble(priceInputController.text),
          image: imageFileSelected!,
        ),
      );
    }
  }

  Future<void> insertProduct(ProductEntity product) async {
    isLoading.value = true;
    final res = await _productRepository.insert(product: product);
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) {
        products.add(r);
        _resetForm();
        Get.back();
      },
    );
    isLoading.value = false;
  }

  Future<void> getAllProduct() async {
    isLoading.value = true;
    final res = await _productRepository.getAll();
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => products.assignAll(r),
    );
    isLoading.value = false;
  }

  Future<void> getByCategory(int idCategory) async {
    isLoading.value = true;
    final res = await _productRepository.getByCategory(idCategory);
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => products.assignAll(r),
    );
    isLoading.value = false;
  }

  Future<void> updateProduct(ProductEntity product) async {
    isLoading.value = true;
    final res = await _productRepository.update(product: product);
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => null,
    );
    isLoading.value = false;
  }

  Future<void> deleteProduct(int id) async {
    isLoading.value = true;
    final res = await _productRepository.delete(id);

    if (res) {
      isLoading.value = false;
      products.removeWhere((element) => element.id == id);
      DialogWidget.feedback(result: true, message: 'Produto deletado com sucesso');
    } else {
      isLoading.value = false;
      DialogWidget.feedback(result: false, message: 'Erro ao deletar produto');
    }
  }
}
