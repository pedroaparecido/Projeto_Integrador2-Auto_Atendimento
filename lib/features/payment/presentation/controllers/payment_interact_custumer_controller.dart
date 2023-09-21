import 'package:atendimento_automatico/core/configs/route_config.dart';
import 'package:get/get.dart';

import '../enums/payment_type_enum.dart';

class PaymentInteractCustumerController extends GetxController {
  var arguments = PaymentType.card;

  final messagePay = 'Inicializando....'.obs;

  @override
  void onInit() {
    arguments = Get.arguments;

    if (arguments == PaymentType.card) paymentMessageCard();
    if (arguments == PaymentType.pix) paymentMessagePix();

    super.onInit();
  }

  Future<void> paymentMessageCard() async {
    await Future.delayed(const Duration(seconds: 3));
    messagePay.value = 'Insira seu cartão';
    await Future.delayed(const Duration(seconds: 3));
    messagePay.value = 'Digite sua senha';
    await Future.delayed(const Duration(seconds: 3));
    messagePay.value = 'Pagamento efetuado com sucesso!';
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(RouteConfig.orderInsert);
  }

  Future<void> paymentMessagePix() async {
    messagePay.value = 'Abra seu aplicativo do banco e leia o QrCode';
    await Future.delayed(const Duration(seconds: 3));
    messagePay.value = 'Pagamento efetuado com sucesso!';
    Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(RouteConfig.orderInsert);
  }
}
