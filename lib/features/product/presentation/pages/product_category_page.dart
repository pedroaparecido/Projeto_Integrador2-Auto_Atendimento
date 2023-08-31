import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../admin/presentation/widgets/admin_body_widget.dart';
import '../../../admin/presentation/widgets/admin_menu_drawer_widget.dart';
import '../controllers/product_category_register_controller.dart';
import '../widgets/product_category_register_widget.dart';

class ProductCategoryPage extends StatelessWidget {
  ProductCategoryPage({super.key});

  final _controller = Get.put(ProductCategoryRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem - Categoria de Produto'),
        actions: [
          IconButton(
            tooltip: 'Adicionar Categoria',
            icon: const Icon(Icons.add),
            onPressed: () => Get.dialog(
              Center(child: ProductCategoryRegisterWidget()),
              name: 'Adicionar Categoria',
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
                    child: Center(
                      child: SizedBox(height: 100, child: LoadingWidget(title: 'Carregando categorias...')),
                    ))
                : _controller.productCategories.isEmpty
                    ? const SizedBox(height: 600, child: Center(child: Text('Nenhum categoria cadastrada')))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _controller.productCategories.length,
                        itemBuilder: (context, index) {
                          final category = _controller.productCategories[index];
                          return ListTile(
                            tileColor: index % 2 == 0 ? const Color(0xFFE0E0E0) : null,
                            leading: Text('#000${category.id}'),
                            title: Text(category.name),
                            trailing: SizedBox(
                              width: 80,
                              child: Row(
                                children: [
                                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Colors.blue)),
                                  IconButton(
                                      onPressed: () => _controller.deleteProductCategory(category.id!),
                                      icon: const Icon(Icons.delete, color: Colors.red)),
                                ],
                              ),
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
