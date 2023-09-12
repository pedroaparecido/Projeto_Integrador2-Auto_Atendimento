import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/configs/route_config.dart';

class AdminMenuDrawerWidget extends StatelessWidget {
  const AdminMenuDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('Empresa'),
              onTap: () => Get.offNamed(RouteConfig.companyRegister)),
          ListTile(
              leading: const Icon(Icons.production_quantity_limits_rounded),
              title: const Text('Produto'),
              onTap: () => Get.offNamed(RouteConfig.product)),
          ListTile(
              leading: const Icon(Icons.category_outlined),
              title: const Text('Categoria'),
              onTap: () => Get.offNamed(RouteConfig.productCategory)),
          ListTile(
            leading: const Icon(Icons.camera_front),
            title: const Text('Banners'),
            onTap: () => Get.offNamed(RouteConfig.images),
          ),
          ListTile(
              leading: const Icon(Icons.output_rounded),
              title: const Text('Sair'),
              onTap: () => Get.offNamed(RouteConfig.cartPage)),
        ],
      ),
    );
  }
}
