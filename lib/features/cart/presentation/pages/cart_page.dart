import 'package:atendimento_automatico/features/cart/presentation/controllers/cart_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/presentation/controllers/product_category_dropdown_controller.dart';
import '../../../product/presentation/controllers/product_controller.dart';
import '../../../product/presentation/widgets/product_card_list_tiled_widget.dart';
import '../../../product/presentation/widgets/product_category_card_list_tile_widget.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final _cartController = Get.put(CartController());
  final _categoryController = Get.put(ProductCategoryDropdownController());
  final _productController = Get.put(ProductController());

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
                  flex: 3,
                  child: Container(
                    color: Colors.amber,
                    child: Obx(
                      () => _categoryController.isLoading.value
                          ? const SizedBox(
                              height: 320,
                              child: Center(child: SizedBox(height: 100, child: Text('Carregando categorias...'))))
                          : ListView.builder(
                              itemCount: _categoryController.productCategories.length,
                              padding: const EdgeInsets.only(bottom: 130),
                              itemBuilder: (context, index) {
                                return ProductCategoryCardListTileWidget(
                                  category: _categoryController.productCategories[index],
                                  onPressed: (value) => _productController.getByCategory(value.id!),
                                );
                              },
                            ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          'LISTAGEM DE PRODUTOS',
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
                      // Expanded(
                      //   child: Obx(
                      //     () => _productController.isLoading.value
                      //         ? const SizedBox(
                      //             height: 320,
                      //             child: Center(child: SizedBox(height: 100, child: Text('Carregando produtos...'))))
                      //         : ScopedModelDescendant<CartModel>(
                      //             builder: (_, __, cart) {
                      //               return ListView.builder(
                      //                   itemCount: _productController.products.length,
                      //                   padding: const EdgeInsets.only(bottom: 130),
                      //                   itemBuilder: (context, index) {
                      //                     return ProductCardListTileWidget(
                      //                       cart: cart,
                      //                       product: _productController.products.elementAt(index),
                      //                     );
                      //                   });
                      //             },
                      //           ),
                      //   ),
                      // )
                      Expanded(
                        child: Obx(
                          () => _productController.isLoading.value
                              ? const SizedBox(
                                  height: 320,
                                  child: Center(child: SizedBox(height: 100, child: Text('Carregando produtos...'))))
                              : ListView.builder(
                                  itemCount: _productController.products.length,
                                  padding: const EdgeInsets.only(bottom: 130),
                                  itemBuilder: (context, index) {
                                    final product = _productController.products[index];
                                    return ProductCardListTileWidget(
                                      product: product,
                                      onPressed: () => _cartController.addItemCart(product),
                                    );
                                  }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: _cartController.clearItemsCart,
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
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
                            'CANCELAR PEDIDO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: _cartController.toCartDetail,
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
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
                            'CONFERIR PEDIDO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
