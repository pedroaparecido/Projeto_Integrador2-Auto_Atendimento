import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import 'product_category_dropdown_widget.dart';

class ProductRegisterWidget extends StatelessWidget {
  ProductRegisterWidget({super.key});

  final _controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: 800,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Form(
                  key: _controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Cadastro de Produto',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () => _controller.isLoading.value
                            ? const Center(child: SizedBox(height: 40, child: CircularProgressIndicator()))
                            : _controller.imageFileSelected == null
                                ? Image.asset(
                                    'assets/images/no-img.jpg',
                                    height: 180.0,
                                    width: 250,
                                  )
                                : Image.memory(_controller.imageFileSelected!, height: 250),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _controller.getLocalImage,
                        child: const Text('Adicionar Imagem'),
                      ),
                      const SizedBox(height: 35),
                      ProductCategoryDropdownWidget(
                        onSaved: (value) => _controller.productCategory = value!,
                        onChanged: (value) => _controller.productCategory = value!,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _controller.nameInputController,
                        strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                        decoration: const InputDecoration(
                          labelText: 'Nome do Produto',
                        ),
                      ),
                      TextFormField(
                        controller: _controller.descriptionInputController,
                        strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                        decoration: const InputDecoration(
                          labelText: 'Detalhes do Produto',
                        ),
                      ),
                      TextFormField(
                        controller: _controller.priceInputController,
                        strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Preço do Produto',
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              onPressed: _controller.cancelInsert,
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                              onPressed: _controller.validForm,
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
