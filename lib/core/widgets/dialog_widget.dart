import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidget {
  static void feedback({required bool result, String? message}) {
    result
        ? Get.snackbar('OK!!!', message ?? 'Operação concluida com sucesso!')
        : Get.defaultDialog(
            title: 'Opsss!!!!!',
            middleText: message != null ? message.replaceAll('Exception: ', '') : 'Operação não executada!',
            barrierDismissible: false,
            backgroundColor: Colors.orange,
            confirm: ElevatedButton(onPressed: Get.back, child: const Text('OK')));
  }
}
