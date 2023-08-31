import 'package:get/get.dart';

import '../../../../core/widgets/dialog_widget.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/product_category_entity.dart';
import '../../domain/repositories/product_category_repository.dart';

class ProductCategoryDropdownController extends GetxController {
  final _productCategoryRepository = sl<ProductCategoryRepository>();

  final isLoading = false.obs;

  final productCategories = <ProductCategoryEntity>[].obs;
  // ProductCategoryEntity? productCategory;

  @override
  void onInit() async {
    await getAllProductCategory();
    super.onInit();
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
}
