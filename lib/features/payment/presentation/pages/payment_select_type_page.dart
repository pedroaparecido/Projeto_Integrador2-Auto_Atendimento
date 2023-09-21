import 'package:atendimento_automatico/core/configs/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../enums/payment_type_enum.dart';
import '../widgets/payment_type_list_tile_widget.dart';

class PaymentSelectTypePage extends StatelessWidget {
  const PaymentSelectTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Selecione sua forma de pagamento',
                textAlign: TextAlign.center,
                style: TextStyle(
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
            ),
            const SizedBox(height: 150),
            PaymentTypeListTileWidget(
              title: 'Cartão de Crédito',
              icon: const Icon(Icons.credit_card, size: 120, color: Colors.purple),
              onPressed: () => Get.toNamed(RouteConfig.paymentInteract, arguments: PaymentType.card),
            ),
            PaymentTypeListTileWidget(
              title: 'Cartão de Débito',
              icon: const Icon(Icons.credit_card, size: 120, color: Colors.green),
              onPressed: () => Get.toNamed(RouteConfig.paymentInteract, arguments: PaymentType.card),
            ),
            PaymentTypeListTileWidget(
              title: 'PIX',
              icon: const Icon(Icons.pix, size: 120, color: Colors.blue),
              onPressed: () => Get.toNamed(RouteConfig.paymentInteract, arguments: PaymentType.pix),
            ),
          ],
        ),
      ),
    );
  }
}
