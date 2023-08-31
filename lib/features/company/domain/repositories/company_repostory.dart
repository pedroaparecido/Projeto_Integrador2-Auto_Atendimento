import 'package:dartz/dartz.dart';

import '../entities/company_entity.dart';

abstract class CompanyRepository {
  Future<Either<Exception, CompanyEntity>> get();
  Future<Either<Exception, CompanyEntity>> update({required CompanyEntity company});
}
