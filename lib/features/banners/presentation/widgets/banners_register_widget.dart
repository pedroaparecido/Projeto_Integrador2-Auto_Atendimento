import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/banners_controller.dart';

class BannersRegisterWidget extends StatelessWidget {
  BannersRegisterWidget({super.key});

  final _controller = Get.find<BannersController>();

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Cadastro de Banner',
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
                                : Image.memory(_controller.imageFileSelected!),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _controller.getLocalImage,
                              child: const Text('Adicionar Imagem'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              onPressed: () {
                                _controller.imageFileSelected = null;
                                Get.back();
                              },
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
                              onPressed: _controller.insertBanner,
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
