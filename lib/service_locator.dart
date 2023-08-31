import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'core/core_locator.dart';
import 'features/banners/banners_locator.dart';
import 'features/company/company_locator.dart';
import 'features/company/presentation/controllers/company_public_controller.dart';
import 'features/product/product_locator.dart';

final sl = GetIt.instance;

void init() {
  CoreLocator.init(sl);
  ProductLocator.init(sl);
  CompanyLocator.init(sl);
  BannersLocator.init(sl);

  //#### inicialização dos controllers GetX singletons
  Get.put(CompanyPublicController());
}
