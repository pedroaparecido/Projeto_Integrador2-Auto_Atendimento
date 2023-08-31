import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:atendimento_automatico/features/company/domain/entities/company_entity.dart';
import 'package:atendimento_automatico/features/company/domain/repositories/company_repostory.dart';

import '../../../../core/widgets/dialog_widget.dart';
import '../../../../service_locator.dart';

class CompanyController extends GetxController {
  final _companyRepository = sl<CompanyRepository>();

  final isLoading = false.obs;

  final razaoSocialInputController = TextEditingController();
  final nomeFantasiaInputController = TextEditingController();
  final cnpjInputController = TextEditingController();
  final ruaInputController = TextEditingController();
  final numeroInputController = TextEditingController();
  final cidadeInputController = TextEditingController();
  final cepInputController = TextEditingController();
  final bairroInputController = TextEditingController();
  final telefoneInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final facebookInputController = TextEditingController();
  final instagramInputController = TextEditingController();
  final whatsappInputController = TextEditingController();
  final missaoInputController = TextEditingController();
  final visaoInputController = TextEditingController();
  final valoresInputController = TextEditingController();
  final senhaDeAcessoInputController = TextEditingController();

  CompanyEntity? company;

  @override
  void onInit() async {
    await getCompany();
    super.onInit();
  }

  Future<void> getCompany() async {
    isLoading.value = true;
    final res = await _companyRepository.get();
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => addInputsDataControllers(r),
    );
    isLoading.value = false;
  }

  void addInputsDataControllers(CompanyEntity company) {
    this.company = company;
    razaoSocialInputController.text = company.razaoSocial;
    nomeFantasiaInputController.text = company.nomeFantasia;
    cnpjInputController.text = company.cnpj;
    ruaInputController.text = company.rua;
    numeroInputController.text = company.numero;
    cidadeInputController.text = company.cidade;
    cepInputController.text = company.cep;
    bairroInputController.text = company.bairro;
    telefoneInputController.text = company.telefone;
    emailInputController.text = company.email;
    facebookInputController.text = company.facebook;
    instagramInputController.text = company.instagram;
    whatsappInputController.text = company.whatsapp;
    missaoInputController.text = company.missao;
    visaoInputController.text = company.visao;
    valoresInputController.text = company.valores;
    senhaDeAcessoInputController.text = '';
  }

  Future<void> updateCompany() async {
    isLoading.value = true;
    final res = await _companyRepository.update(
      company: CompanyEntity(
        razaoSocial: razaoSocialInputController.text,
        nomeFantasia: nomeFantasiaInputController.text,
        cnpj: cnpjInputController.text,
        rua: ruaInputController.text,
        numero: numeroInputController.text,
        cidade: cidadeInputController.text,
        cep: cepInputController.text,
        bairro: bairroInputController.text,
        telefone: telefoneInputController.text,
        email: emailInputController.text,
        facebook: facebookInputController.text,
        instagram: instagramInputController.text,
        whatsapp: whatsappInputController.text,
        missao: missaoInputController.text,
        visao: visaoInputController.text,
        valores: valoresInputController.text,
        senhaDeAcesso: senhaDeAcessoInputController.text,
      ),
    );
    res.fold(
      (l) => DialogWidget.feedback(result: false, message: l.toString()),
      (r) => addInputsDataControllers(r),
    );
    isLoading.value = false;
  }
}
