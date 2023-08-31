import 'package:get_it/get_it.dart';
import 'package:atendimento_automatico/features/banners/data/repositories/banners_repository_impl.dart';
import 'data/data_sources/banners_data_source.dart';
import 'domain/repositories/banners_repository.dart';

class BannersLocator {
  static void init(GetIt sl) {
    // Data sources
    sl.registerFactory<BannersDataSource>(() => BannersDataSourceImpl(sl()));

    // Repository
    sl.registerFactory<BannersRepository>(() => BannersRepositoryImpl(sl()));
  }
}
