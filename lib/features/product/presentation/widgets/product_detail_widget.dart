import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/regularize_helper.dart';
import '../../domain/entities/product_entity.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({super.key, required ProductEntity product}) : _product = product;

  final ProductEntity _product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        _product.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      Image.memory(
                        _product.image,
                        width: 250.0,
                        height: 250.0,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          _product.description,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Text(
                        RegularizeHelper.doubleToRealCurrency(value: _product.price),
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: Get.back,
                          child: const Text('Fechar'),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
