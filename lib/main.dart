import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';

import 'core/configs/route_config.dart';
import 'features/admin/presentation/pages/admin_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/banners/presentation/pages/banners_page.dart';
import 'features/company/presentation/pages/company_register_page.dart';
import 'features/product/presentation/pages/product_category_page.dart';
import 'features/product/presentation/pages/product_page.dart';
import 'features/public/presentation/pages/about_page.dart';
import 'features/public/presentation/pages/contact_page.dart';
import 'features/public/presentation/pages/home_page.dart';
import 'service_locator.dart' as service_locator;
import 'cartmodel.dart';

void main() {
  service_locator.init();
  runApp(MyApp(
    model: CartModel(),
  ));
}

class MyApp extends StatelessWidget {
  final CartModel model;

  const MyApp({Key? key, required this.model}) : super(key: key);

  static bool isAdmin = true;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartModel>(
      model: model,
      child: GetMaterialApp(
        title: 'Auto-Atendimento',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RouteConfig.home,
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: RouteConfig.home, page: () => const HomePage()),
          GetPage(name: RouteConfig.about, page: () => const AboutPage()),
          GetPage(name: RouteConfig.contact, page: () => ContactPage()),
          GetPage(name: RouteConfig.companyRegister, page: () => isAdmin ? CompanyRegisterPage() : LoginPage()),
          GetPage(name: RouteConfig.product, page: () => ProductPage()),
          GetPage(name: RouteConfig.images, page: () => BannersPage()),
          GetPage(name: RouteConfig.productCategory, page: () => ProductCategoryPage()),
          GetPage(name: RouteConfig.adminPage, page: () => const AdminPage()),
          GetPage(name: RouteConfig.login, page: () => LoginPage()),
        ],
      )
    );
  }
}
