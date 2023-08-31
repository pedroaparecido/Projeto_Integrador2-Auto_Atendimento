import 'package:get_it/get_it.dart';

import 'data/data_sources/product_category_data_source.dart';
import 'data/data_sources/product_data_source.dart';
import 'data/repositories/product_category_repository_impl.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/repositories/product_category_repository.dart';
import 'domain/repositories/product_repository.dart';

class ProductLocator {
  static void init(GetIt sl) {
    // Data sources
    sl.registerFactory<ProductCategoryDataSource>(() => ProductCategoryDataSourceImpl(sl()));
    sl.registerFactory<ProductDataSource>(() => ProductDataSourceImpl(sl()));

    // Repository
    sl.registerFactory<ProductCategoryRepository>(() => ProductCategoryRepositoryImpl(sl()));
    sl.registerFactory<ProductRepository>(() => ProductRepositoryImpl(sl()));
  }
}
