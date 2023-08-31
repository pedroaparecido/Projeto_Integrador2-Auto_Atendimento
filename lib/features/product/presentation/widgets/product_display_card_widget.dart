import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProductDisplayCardWidget extends StatelessWidget {
  const ProductDisplayCardWidget({
    super.key,
    required this.image,
    required this.nameProduct,
    required this.priceProduct,
  });

  final Uint8List image;
  final String nameProduct;
  final String priceProduct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Card(
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Image.memory(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          nameProduct.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          priceProduct,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
