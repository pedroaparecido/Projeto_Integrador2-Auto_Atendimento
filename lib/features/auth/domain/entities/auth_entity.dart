import 'package:atendimento_automatico/features/company/domain/entities/company_entity.dart';

class AuthEntity {
  AuthEntity({
    this.company,
    this.isLogged = false,
  });

  CompanyEntity? company;
  bool isLogged;

  @override
  String toString() => 'AuthEntity(company: $company, isLogged: $isLogged)';
}
