import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/footer_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../admin/presentation/widgets/admin_menu_drawer_widget.dart';
import '../controllers/company_controller.dart';

class CompanyRegisterPage extends StatelessWidget {
  CompanyRegisterPage({super.key});

  final _controller = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro - Empresa'),
      ),
      drawer: const AdminMenuDrawerWidget(),
      body: Obx(
        () => _controller.isLoading.value
            ? const LoadingWidget(title: 'Carregando Empresa...')
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                'Dados Cadastrais',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Divider(),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: _controller.razaoSocialInputController,
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Razão Social',
                                ),
                              ),
                              TextFormField(
                                controller: _controller.nomeFantasiaInputController,
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Nome Fantasia',
                                ),
                              ),
                              // TODO: ver se averá tempo para por mascara
                              TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'CNPJ',
                                ),
                                controller: _controller.cnpjInputController,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: TextFormField(
                                      strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                      decoration: const InputDecoration(
                                        labelText: 'Rua',
                                      ),
                                      controller: _controller.ruaInputController,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                      decoration: const InputDecoration(
                                        labelText: 'Número',
                                      ),
                                      controller: _controller.numeroInputController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: TextFormField(
                                      strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                      decoration: const InputDecoration(
                                        labelText: 'Cidade',
                                      ),
                                      controller: _controller.cidadeInputController,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextFormField(
                                      strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                      decoration: const InputDecoration(
                                        labelText: 'CEP',
                                      ),
                                      controller: _controller.cepInputController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                      decoration: const InputDecoration(
                                        labelText: 'Bairro',
                                      ),
                                      controller: _controller.bairroInputController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                      decoration: const InputDecoration(
                                        labelText: 'Telefone',
                                      ),
                                      controller: _controller.telefoneInputController,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'E-mail',
                                ),
                                controller: _controller.emailInputController,
                              ),
                              TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Facebook',
                                ),
                                controller: _controller.facebookInputController,
                              ),
                              TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Instagram',
                                ),
                                controller: _controller.instagramInputController,
                              ),
                              TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'WhatsApp',
                                ),
                                controller: _controller.whatsappInputController,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Missão',
                                ),
                                controller: _controller.missaoInputController,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Visão',
                                ),
                                controller: _controller.visaoInputController,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Valores',
                                ),
                                controller: _controller.valoresInputController,
                              ),
                              TextFormField(
                                strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
                                decoration: const InputDecoration(
                                  labelText: 'Senha de Acesso',
                                ),
                                obscureText: true,
                              ),
                              const SizedBox(height: 25),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                                onPressed: _controller.updateCompany,
                                child: const Text(
                                  'Atualizar',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                    FooterWidget(),
                  ],
                ),
              ),
      ),
    );
  }
}
