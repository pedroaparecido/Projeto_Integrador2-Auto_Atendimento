import 'package:atendimento_automatico/features/order/domain/entities/order_entity.dart';
import 'package:atendimento_automatico/features/order/domain/repositories/order_repository.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/dialog_widget.dart';
import '../../../../service_locator.dart';

class OrderController extends GetxController {
  final _orderRepository = sl<OrderRepository>();

  final isLoading = false.obs;
  final orders = <OrderEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> insertOrder(OrderEntity order) async {
    isLoading.value = true;
    final res = await _orderRepository.insert(order: order);
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) {
        orders.add(r);
        Get.back();
      },
    );
    isLoading.value = false;
  }

  Future<void> getByStatus(int status) async {
    isLoading.value = true;
    final res = await _orderRepository.getByStatus(status);
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => orders.assignAll(r),
    );
    isLoading.value = false;
  }
}
