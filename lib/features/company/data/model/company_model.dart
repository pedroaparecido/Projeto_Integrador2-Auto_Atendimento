import 'dart:convert';

import 'package:atendimento_automatico/features/company/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    super.id,
    required super.razaoSocial,
    required super.nomeFantasia,
    required super.cnpj,
    required super.rua,
    required super.numero,
    required super.cidade,
    required super.cep,
    required super.bairro,
    required super.telefone,
    required super.email,
    required super.facebook,
    required super.instagram,
    required super.whatsapp,
    required super.missao,
    required super.visao,
    required super.valores,
  });

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id']?.toInt(),
      razaoSocial: map['legal_name'] ?? '',
      nomeFantasia: map['trade_name'] ?? '',
      cnpj: map['cnpj'] ?? '',
      rua: map['street'] ?? '',
      numero: map['street_number'] ?? '',
      cidade: map['city'] ?? '',
      cep: map['postal_code'] ?? '',
      bairro: map['neighborhood'] ?? '',
      telefone: map['phone'] ?? '',
      email: map['email'] ?? '',
      facebook: map['facebook'] ?? '',
      instagram: map['instagram'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      missao: map['mission'] ?? '',
      visao: map['vision'] ?? '',
      valores: map['values'] ?? '',
    );
  }

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));
}
