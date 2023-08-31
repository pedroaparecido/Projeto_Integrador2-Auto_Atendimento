import 'package:atendimento_automatico/features/company/data/data_sources/company_data_source.dart';
import 'package:atendimento_automatico/features/company/domain/entities/company_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/company_repostory.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  CompanyRepositoryImpl(this._dataSource);

  final CompanyDataSource _dataSource;

  @override
  Future<Either<Exception, CompanyEntity>> get() async {
    try {
      final res = await _dataSource.get();
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possivel buscar empresa\nError: $err'));
    }
  }

  @override
  Future<Either<Exception, CompanyEntity>> update({required CompanyEntity company}) async {
    try {
      final res = await _dataSource.update(company: company);
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possivel buscar empresa\nError: $err'));
    }
  }
}
