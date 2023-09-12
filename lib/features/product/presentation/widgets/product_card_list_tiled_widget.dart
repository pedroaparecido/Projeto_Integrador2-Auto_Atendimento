import 'package:flutter/material.dart';

import '../../../../core/helpers/regularize_helper.dart';
import '../../domain/entities/product_entity.dart';

class ProductCardListTileWidget extends StatelessWidget {
  // final CartModel cart;
  final ProductEntity product;
  final void Function()? onPressed;

  const ProductCardListTileWidget({super.key, required this.product, required this.onPressed});

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
                  image: Image.memory(
                    product.image,
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
            child: Text('${product.name} ${RegularizeHelper.doubleToRealCurrency(value: product.price)}',
                textAlign: TextAlign.center, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                // onPressed: () => {
                //   cart.addProduct(
                //       Product(id: product.id!, title: product.name, price: product.price, qty: 1, image: product.image))
                // },
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
