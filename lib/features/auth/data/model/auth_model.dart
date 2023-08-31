import 'dart:convert';

import '../../../company/data/model/company_model.dart';
import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    // required super.isLogged,
    required super.company,
  });

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      // isLogged: map['password'],
      company: CompanyModel.fromMap(map['company']),
    );
  }

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source));
}
