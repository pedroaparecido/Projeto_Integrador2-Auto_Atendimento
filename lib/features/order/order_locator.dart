import 'package:atendimento_automatico/features/order/data/data_sources/order_data_source.dart';
import 'package:atendimento_automatico/features/order/data/repositories/order_repository_impl.dart';
import 'package:atendimento_automatico/features/order/domain/repositories/order_repository.dart';
import 'package:get_it/get_it.dart';

class OrderLocator {
  static void init(GetIt sl) {
    // Data sources
    sl.registerFactory<OrderDataSource>(() => OrderDataSourceImpl(sl()));

    // Repository
    sl.registerFactory<OrderRepository>(() => OrderRepositoryImpl(sl()));
  }
}
