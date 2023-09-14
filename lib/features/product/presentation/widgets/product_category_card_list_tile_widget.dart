import 'package:flutter/material.dart';

import '../../domain/entities/product_category_entity.dart';

class ProductCategoryCardListTileWidget extends StatelessWidget {
  final ProductCategoryEntity category;
  final void Function(ProductCategoryEntity value) onPressed;

  const ProductCategoryCardListTileWidget({Key? key, required this.category, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(category),
      child: Container(
        margin: const EdgeInsets.all(14),
        padding: const EdgeInsets.only(bottom: 20),
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: Image.memory(
                    category.image,
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
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
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
          ),
        ),
      ),
    );
  }
}
