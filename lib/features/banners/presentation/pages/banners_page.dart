import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../admin/presentation/widgets/admin_body_widget.dart';
import '../../../admin/presentation/widgets/admin_menu_drawer_widget.dart';
import '../controllers/banners_controller.dart';
import '../widgets/banners_register_widget.dart';

class BannersPage extends StatelessWidget {
  BannersPage({super.key});

  final _controller = Get.put(BannersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro - Banners'),
        actions: [
          IconButton(
            tooltip: 'Adicionar Banner',
            icon: const Icon(Icons.add),
            onPressed: () => Get.dialog(
              Center(child: BannersRegisterWidget()),
              name: 'Adicionar Banner',
              barrierDismissible: false,
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
      drawer: const AdminMenuDrawerWidget(),
      body: AdminBodyWidget(
        children: [
          Obx(
            () => _controller.isLoading.value
                ? const SizedBox(
                    height: 600,
                    child: Center(child: SizedBox(height: 100, child: LoadingWidget(title: 'Carregando banners'))))
                : _controller.banners.isEmpty
                    ? const SizedBox(height: 600, child: Center(child: Text('Nenhum banner cadastrado')))
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 14),
                        shrinkWrap: true,
                        itemCount: _controller.banners.length,
                        itemBuilder: (context, index) {
                          final banner = _controller.banners[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14.0),
                            child: Container(
                              color: index % 2 == 0 ? const Color(0xFFD6D4D4) : const Color(0xFFF7F4F4),
                              child: Row(children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 200,
                                    child: Image.memory(
                                      banner.image,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Deletar banner',
                                  onPressed: () => _controller.deleteBanner(banner.id!),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ]),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
