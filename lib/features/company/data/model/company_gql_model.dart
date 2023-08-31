import 'package:atendimento_automatico/features/company/domain/entities/company_entity.dart';

class CompanyGqlModel {
  static String get() => '''query {
  company_by_pk(id: 2) {
    id
    legal_name
    trade_name
    cnpj
    email
    phone
    street
    street_number
    neighborhood
    city
    postal_code
    facebook
    instagram
    whatsapp
    mission
    vision
    values
  }
}''';

  static String update(CompanyEntity company) => '''mutation {
  update_company_by_pk(pk_columns: {id: 2}, _set: {
    legal_name: "${company.razaoSocial}", 
    trade_name: "${company.nomeFantasia}", 
    cnpj: "${company.cnpj}", 
    email: "${company.email}", 
    phone: "${company.telefone}", 
    street: "${company.rua}", 
    street_number: "${company.numero}", 
    neighborhood: "${company.bairro}", 
    city: "${company.cidade}", 
    postal_code: "${company.cep}", 
    facebook: "${company.facebook}", 
    instagram: "${company.instagram}",
    whatsapp: "${company.whatsapp}",
    mission: "${company.missao}", 
    vision: "${company.visao}", 
    values: "${company.valores}", 
    password: "${company.senhaDeAcesso}"
  }) {
    legal_name
    trade_name
    cnpj
    email
    phone
    street
    street_number
    neighborhood
    city
    postal_code
    facebook
    instagram
    whatsapp
    mission
    vision
    values
  }
}''';
}
