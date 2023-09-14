import 'package:atendimento_automatico/core/configs/route_config.dart';
import 'package:atendimento_automatico/core/helpers/regularize_helper.dart';
import 'package:atendimento_automatico/features/cart/domain/entities/cart_itens_entity.dart';
import 'package:atendimento_automatico/features/cart/presentation/controllers/cart_controllers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartDetailPage extends StatelessWidget {
  CartDetailPage({super.key});

  final _cartController = Get.find<CartController>();

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
                          'CESTA DE PEDIDOS',
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
                        child: _cartController.itemsCart.isEmpty
                            ? const Center(
                                child: Text("Não exite produtos no carrinho...."),
                              )
                            : Obx(
                                () => ListView.builder(
                                  itemCount: _cartController.itemsCart.length,
                                  itemBuilder: (context, index) {
                                    final item = _cartController.itemsCart[index];
                                    return ProductDetailCardListTileWidget(indexItem: index, item: item);
                                  },
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: Get.back,
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            // topRight: Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Voltar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
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
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      color: Colors.blue,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Total Pedido',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Obx(
                              () => Text(
                                _cartController.valueTotalItems.value == -0.00
                                    ? 'R\$ 0,00'
                                    : RegularizeHelper.doubleToRealCurrency(
                                        value: _cartController.valueTotalItems.value),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
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
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => InkWell(
                        onTap: _cartController.itemsCart.isEmpty
                            ? null
                            : () => Navigator.popAndPushNamed(context, RouteConfig.paymentType),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: _cartController.itemsCart.isEmpty ? Colors.grey : Colors.green,
                            borderRadius: const BorderRadius.only(
                              // topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Pagar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailCardListTileWidget extends StatelessWidget {
  ProductDetailCardListTileWidget({super.key, required this.indexItem, required this.item});
  final int indexItem;
  final CartItemsEntity item;

  final _cartController = Get.find<CartController>();

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
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _cartController.incrementItem(item),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Icon(Icons.add_box_outlined, size: 50),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _cartController.decrementItem(item),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: const Icon(Icons.remove_circle_outline, size: 50),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: Image.memory(
                    item.product.image,
                    fit: BoxFit.fitHeight,
                  ).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ListTile(
              title: Text(
                item.product.name,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Obx(
                () => _cartController.refreshTotalItems.value
                    ? Container()
                    : Text(
                        '\n${item.getQntyItem.toString().padLeft(2, '0')} x ${RegularizeHelper.doubleToRealCurrency(value: item.product.price)}'
                        '\nSub Total: ${RegularizeHelper.doubleToRealCurrency(value: item.totalValueItens)}',
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () => _cartController.removeItemCart(indexItem),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Icon(Icons.delete_outline_outlined, size: 50),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
