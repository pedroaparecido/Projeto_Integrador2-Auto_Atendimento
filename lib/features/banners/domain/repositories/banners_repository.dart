import 'package:dartz/dartz.dart';
import 'package:atendimento_automatico/features/banners/domain/entities/banners_entity.dart';

abstract class BannersRepository {
  Future<Either<Exception, BannersEntity>> insert({required String image});
  Future<bool> delete(int id);
  Future<Either<Exception, List<BannersEntity>>> getAll();
}
