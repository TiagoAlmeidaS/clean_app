import 'package:clean_app/core/errors/exception.dart';
import 'package:clean_app/features/data/datasources/space_media_datasource.dart';
import 'package:clean_app/features/domain/entities/space_media_entity.dart';
import 'package:clean_app/core/errors/failures.dart';
import 'package:clean_app/features/domain/repositories/space_media_from_date_repository.dart';
import 'package:dartz/dartz.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDataSource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async {
    try{
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
