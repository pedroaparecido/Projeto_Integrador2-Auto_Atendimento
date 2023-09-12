import 'package:atendimento_automatico/features/cart/presentation/pages/cart_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/configs/route_config.dart';
import 'features/admin/presentation/pages/admin_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/banners/presentation/pages/banners_page.dart';
import 'features/company/presentation/pages/company_register_page.dart';
import 'features/payment/presentation/pages/payment_select_type_page.dart';
import 'features/payment/presentation/pages/processing_payment_page.dart';
import 'features/payment/presentation/pages/status_payment_page.dart';
import 'features/product/presentation/pages/product_category_page.dart';
import 'features/product/presentation/pages/product_page.dart';
import 'features/public/presentation/pages/about_page.dart';
import 'features/public/presentation/pages/contact_page.dart';
import 'features/cart/presentation/pages/cart_page.dart';
import 'service_locator.dart' as service_locator;

void main() {
  service_locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool isAdmin = true;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Auto-Atendimento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteConfig.cartPage,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: RouteConfig.cartPage, page: () => CartPage()),
        GetPage(name: RouteConfig.cartDetail, page: () => CartDetailPage()),
        GetPage(name: RouteConfig.about, page: () => const AboutPage()),
        GetPage(name: RouteConfig.contact, page: () => ContactPage()),
        GetPage(name: RouteConfig.companyRegister, page: () => isAdmin ? CompanyRegisterPage() : LoginPage()),
        GetPage(name: RouteConfig.product, page: () => ProductPage()),
        GetPage(name: RouteConfig.images, page: () => BannersPage()),
        GetPage(name: RouteConfig.productCategory, page: () => ProductCategoryPage()),
        GetPage(name: RouteConfig.admin, page: () => const AdminPage()),
        GetPage(name: RouteConfig.login, page: () => LoginPage()),
        // GetPage(name: RouteConfig.processingPayment, page: () => const ProcessingPaymentPage()),
        // GetPage(name: RouteConfig.statusPayment, page: () => const StatusPaymentPage()),
        GetPage(name: RouteConfig.paymentType, page: () => const PaymentSelectTypePage()),
      ],
    );
  }
}
