import 'package:flutter/material.dart';

class StatusPaymentPage extends StatelessWidget {
  const StatusPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            'O ID do seu PEDIDO É: XXXXXXXXXX!',
            style: Theme.of(context).textTheme.titleLarge,
            textScaleFactor: 4,
          ),
          //const SizedBox(height: 0),
          const Image(
            image: AssetImage('aprovado.jpg'),
          )
        ]);
  }
}
