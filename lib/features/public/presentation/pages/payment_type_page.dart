import 'package:atendimento_automatico/core/configs/route_config.dart';
import 'package:flutter/material.dart';

class PaymentTypePage extends StatelessWidget {
  const PaymentTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      Expanded(
                          child: ListView(
                        padding: const EdgeInsets.only(bottom: 130),
                        children: const [
                          PaymentTypeListTileWidget(text: 'Cartão de Crédito'),
                          PaymentTypeListTileWidget(text: 'Cartão de Débito'),
                          PaymentTypeListTileWidget(text: 'PIX'),
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentTypeListTileWidget extends StatelessWidget {
  final String text;

  const PaymentTypeListTileWidget({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 4,
      child: Container(
        height: 160,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(children: [
          Expanded(
            flex: 7,
            child: ElevatedButton(
              onPressed: () => {Navigator.popAndPushNamed(context, RouteConfig.processingPayment)},
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600)),
            ),
          ),
        ]),
      ),
    );
  }
}
