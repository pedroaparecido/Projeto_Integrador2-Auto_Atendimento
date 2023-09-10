import 'package:atendimento_automatico/cartmodel.dart';
import 'package:atendimento_automatico/core/configs/route_config.dart';
import 'package:atendimento_automatico/features/product/domain/entities/order_entity.dart';
import 'package:atendimento_automatico/features/product/presentation/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';

class ProcessingPaymentPage extends StatefulWidget {
  const ProcessingPaymentPage({super.key});

  @override
  State<ProcessingPaymentPage> createState() => _ProcessingPaymentPageState();
}

class _ProcessingPaymentPageState extends State<ProcessingPaymentPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  final _orderController = Get.put(OrderController());

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

  // TODO hack-ada pq nao sei como inserir fora do Future.delay
  // se nao fizer isso, a UI fica doida e insere o pedido 1 milhao
  // de vezes
  bool orderInserted = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CartModel>(builder: (context, child, cart) {
      return FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 5),
            () {
              if (!orderInserted) {
                orderInserted = true;
                _orderController
                    .insertOrder(OrderEntity(total: 123))
                    .then((value) {
                  cart.id = _orderController.orders.first.id;
                  Navigator.popAndPushNamed(context, RouteConfig.statusPayment);
                });
              }
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
    });
  }
}
