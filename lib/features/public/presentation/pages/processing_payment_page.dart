import 'package:flutter/material.dart';

class ProcessingPaymentPage extends StatefulWidget {
  const ProcessingPaymentPage({super.key});

  @override
  State<ProcessingPaymentPage> createState() => _ProcessingPaymentPageState();
}

class _ProcessingPaymentPageState extends State<ProcessingPaymentPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 5),
          () {
            Navigator.popAndPushNamed(context, '/status-payment');
          },
        ),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Processando Pagamento',
                style: Theme.of(context).textTheme.titleLarge,
                textScaleFactor: 3,
              ),
              const SizedBox(height: 100),
              CircularProgressIndicator(
                value: controller.value,
                semanticsLabel: 'Processando Pagamento',
              )
            ],
          );
        });
  }
}
