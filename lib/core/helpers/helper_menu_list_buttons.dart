import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/route_config.dart';

final menuListButtons = [
  TextButton(
      onPressed: () => Get.offNamed(RouteConfig.cartPage),
      child: const Text(
        'Produtos',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      )),
  TextButton(
      onPressed: () => Get.offNamed(RouteConfig.about),
      child: const Text(
        'Quem Somos',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      )),
  TextButton(
      onPressed: () => Get.offNamed(RouteConfig.contact),
      child: const Text(
        'Contatos',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      )),
];
