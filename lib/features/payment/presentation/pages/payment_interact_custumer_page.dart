import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/payment_interact_custumer_controller.dart';
import '../enums/payment_type_enum.dart';

class PaymentInteractCustumerPage extends StatelessWidget {
  PaymentInteractCustumerPage({super.key});

  final _controller = Get.put(PaymentInteractCustumerController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LinearProgressIndicator(minHeight: 50),
            const Spacer(),
            switch (_controller.arguments) {
              PaymentType.card => PaymentCardTypeWidget(),
              PaymentType.pix => PaymentPixTypeWidget(),
            },
            const Spacer(),
            SizedBox(
                height: 80,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: Get.back,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: const Text(
                      'Voltar',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

class PaymentPixTypeWidget extends StatelessWidget {
  PaymentPixTypeWidget({super.key});

  final _controller = Get.find<PaymentInteractCustumerController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/pix_qrcode.jpg'),
        Obx(
          () => Text(
            _controller.messagePay.value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 1.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PaymentCardTypeWidget extends StatelessWidget {
  PaymentCardTypeWidget({super.key});

  final _controller = Get.find<PaymentInteractCustumerController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        _controller.messagePay.value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 1.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
