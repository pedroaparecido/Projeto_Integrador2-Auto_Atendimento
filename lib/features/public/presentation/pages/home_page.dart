import 'package:atendimento_automatico/cartmodel.dart';
import 'package:atendimento_automatico/core/configs/route_config.dart';
import 'package:atendimento_automatico/features/product/domain/entities/product_category_entity.dart';
import 'package:atendimento_automatico/features/product/presentation/controllers/product_category_dropdown_controller.dart';
import 'package:atendimento_automatico/features/product/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                      child: Obx(() => _categoryController.isLoading.value
                          ? const SizedBox(
                              height: 320,
                              child: Center(
                                  child: SizedBox(
                                      height: 100,
                                      child: Text('Carregando categorias...'))))
                          : ListView.builder(
                              itemCount:
                                  _categoryController.productCategories.length,
                              padding: const EdgeInsets.only(bottom: 130),
                              itemBuilder: (context, index) {
                                return CategoryCardListTileWidget(
                                    category: _categoryController.productCategories
                                    .elementAt(index));
                              }))),
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
                      Expanded(
                        child: ScopedModelDescendant<CartModel>(
                            builder: (context, child, cart) {
                          return ListView(
                            padding: const EdgeInsets.only(bottom: 130),
                            children: [
                              ProductCardListTileWidget(
                                  cart: cart,
                                  product: Product(
                                      id: 1,
                                      price: 7.99,
                                      qty: 1,
                                      title: 'Coca-Cola 600ml Zero',
                                      imgUrl: 'assets/images/cat_refri.jpg')),
                              ProductCardListTileWidget(
                                  cart: cart,
                                  product: Product(
                                      id: 2,
                                      price: 12.99,
                                      qty: 1,
                                      title: 'Coca-Cola 1l Garrafa',
                                      imgUrl: 'assets/images/cat_refri.jpg')),
                              ProductCardListTileWidget(
                                  cart: cart,
                                  product: Product(
                                      id: 3,
                                      price: 18.99,
                                      qty: 1,
                                      title: 'Coca-Cola 2l descartável',
                                      imgUrl: 'assets/images/cat_refri.jpg')),
                            ],
                          );
                        }),
                      )
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
                  Expanded(
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
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () => {
                                  Navigator.popAndPushNamed(
                                      context, RouteConfig.cart)
                                },
                            child: const Text(
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
                            )),
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

class CategoryCardListTileWidget extends StatelessWidget {
  final ProductCategoryEntity category;

  const CategoryCardListTileWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.only(bottom: 20),
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/cat_refri.jpg'),
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
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          category.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
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
    );
  }
}

class ProductCardListTileWidget extends StatelessWidget {
  final CartModel cart;
  final Product product;

  const ProductCardListTileWidget(
      {Key? key, required this.cart, required this.product})
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
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(product.imgUrl),
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
            child: Text('${product.title} R\$ ${product.price}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () => {cart.addProduct(product)},
                child: const Icon(
                  Icons.add_box_outlined,
                  size: 50,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
