import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../features/company/presentation/controllers/company_public_controller.dart';
import '../helpers/launcher_helper.dart';

class FooterWidget extends StatelessWidget {
  FooterWidget({super.key});

  final _companyController = Get.find<CompanyPublicController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _companyController.isLoading.value
          ? Container()
          : Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              color: const Color(0xFF2A3338),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => LauncherHelper.url(_companyController.company.facebook),
                            icon: const Icon(FontAwesomeIcons.squareFacebook, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => LauncherHelper.url('mailto:${_companyController.company.email}'),
                            icon: const Icon(Icons.email_outlined, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => LauncherHelper.url(_companyController.company.instagram),
                            icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => LauncherHelper.url(_companyController.company.whatsapp),
                            icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      _companyController.company.nomeFantasia,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${_companyController.company.rua}, ${_companyController.company.numero}\n',
                            style: const TextStyle(color: Colors.white)),
                        Text('${_companyController.company.cidade}       CEP ${_companyController.company.cep}\n',
                            style: const TextStyle(color: Colors.white)),
                        Text(_companyController.company.telefone, style: const TextStyle(color: Colors.white)),
                        Text('\nCNPJ ${_companyController.company.cnpj}\n',
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Text('Desenvolvimento Projeto Integrador Univesp - DRPSAOJOSEDORIOPRETO-PJI110-SALA-001GRUPO-007',
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
