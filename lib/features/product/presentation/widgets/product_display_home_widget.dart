import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/regularize_helper.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../controllers/product_controller.dart';
import 'product_category_dropdown_widget.dart';
import 'product_detail_widget.dart';
import 'product_display_card_widget.dart';

class ProductDisplayHomeWidget extends StatelessWidget {
  ProductDisplayHomeWidget({super.key});

  final _controller = Get.put(ProductController());

  double _getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1200) {
      return 1200 / 5.1;
    } else if (screenWidth >= 800) {
      return screenWidth / 4.1;
    } else if (screenWidth >= 600) {
      return screenWidth / 3.1;
    } else {
      return screenWidth / 2.1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1300,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 6,
              color: Colors.blue,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 450,
                    child: Column(
                      children: [
                        const Text(
                          'Filtrar por Categoria',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        ProductCategoryDropdownWidget(
                          labelText: 'Selecione',
                          addAllCategory: true,
                          isRequired: false,
                          onChanged: (value) => _controller.getByCategory(value!.id!),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'QUALIDADE EM PRIMEIRO LUGAR!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5), // Cor da sombra com transparência
                            offset: const Offset(0, 2), // Deslocamento da sombra (horizontal, vertical)
                            blurRadius: 5, // Desfoque da sombra
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => _controller.isLoading.value
                ? const SizedBox(
                    height: 320,
                    child: Center(child: SizedBox(height: 100, child: LoadingWidget(title: 'Carregando produtos...'))))
                : _controller.products.isEmpty
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        height: 350,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.warning_amber_rounded, size: 80),
                              Text('Opss... Nenhum produto encontrado'),
                            ],
                          ),
                        ))
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: _controller.products
                            .map(
                              (product) => SizedBox(
                                width: _getCrossAxisCount(context),
                                child: InkWell(
                                  child: ProductDisplayCardWidget(
                                    nameProduct: product.name,
                                    priceProduct: RegularizeHelper.doubleToRealCurrency(value: product.price),
                                    image: product.image,
                                  ),
                                  onTap: () => Get.dialog(
                                    Center(child: ProductDetailWidget(product: product)),
                                    barrierDismissible: true,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
          ),
        ],
      ),
    );
  }
}
