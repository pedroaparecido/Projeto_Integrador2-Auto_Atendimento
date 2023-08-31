import 'package:dartz/dartz.dart';

import '../../domain/entities/banners_entity.dart';
import '../../domain/repositories/banners_repository.dart';
import '../data_sources/banners_data_source.dart';

class BannersRepositoryImpl implements BannersRepository {
  BannersRepositoryImpl(this._dataSource);

  final BannersDataSource _dataSource;

  @override
  Future<Either<Exception, List<BannersEntity>>> getAll() async {
    try {
      final res = await _dataSource.getAll();
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possivel buscar os banners\nERRO: $err'));
    }
  }

  @override
  Future<Either<Exception, BannersEntity>> insert({required String image}) async {
    try {
      final res = await _dataSource.insert(image: image);
      return Right(res);
    } catch (err) {
      return Left(Exception('Não foi possivel inserir o banner\nERRO: $err'));
    }
  }

  @override
  Future<bool> delete(int id) async {
    final res = await _dataSource.delete(id);
    return res;
  }
}
