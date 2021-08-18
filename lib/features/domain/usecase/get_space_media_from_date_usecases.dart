import 'package:clean_app/core/errors/failures.dart';
import 'package:clean_app/core/usecase/usercase.dart';
import 'package:clean_app/features/domain/entities/space_media_entity.dart';
import 'package:clean_app/features/domain/repositories/space_media_from_date_repository.dart';
import 'package:dartz/dartz.dart';

class GetSpaceMediaFromDateUsecase
    implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}
