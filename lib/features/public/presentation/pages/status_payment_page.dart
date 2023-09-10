import 'package:atendimento_automatico/cartmodel.dart';
import 'package:atendimento_automatico/core/configs/route_config.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StatusPaymentPage extends StatelessWidget {
  const StatusPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 5),
          () {
            Navigator.popAndPushNamed(context, RouteConfig.home);
          },
        ),
        builder: (context, snapshot) {
          return ScopedModelDescendant<CartModel>(builder: (context, child, cart) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pagamento efetuado com sucesso!',
                    style: Theme.of(context).textTheme.titleLarge,
                    textScaleFactor: 2,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'O Rei do Espeto Agradeçe a sua preferência!',
                    style: Theme.of(context).textTheme.titleLarge,
                    textScaleFactor: 2,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'O número do seu pedido é',
                    style: Theme.of(context).textTheme.titleLarge,
                    textScaleFactor: 3,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "${cart.id}",
                    style: Theme.of(context).textTheme.titleLarge,
                    textScaleFactor: 6,
                  ),
                  const SizedBox(height: 50),
                  // Image.asset('assets/images/aprovado.jpg',
                  //     height: 200, width: 200),
                ]);
          });
        });
  }
}
