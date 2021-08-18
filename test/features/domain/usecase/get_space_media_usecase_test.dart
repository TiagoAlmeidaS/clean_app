import 'package:clean_app/core/errors/failures.dart';
import 'package:clean_app/core/usecase/usercase.dart';
import 'package:clean_app/features/domain/entities/space_media_entity.dart';
import 'package:clean_app/features/domain/repositories/space_media_from_date_repository.dart';
import 'package:clean_app/features/domain/usecase/get_space_media_from_date_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
      explanation: "lala",
      mediaType: "media",
      title: "Primeiro teste",
      mediaUrl: "https://appos/asdasd");

  final tNoParams = NoParams();
  final tDate = DateTime(2021, 02, 02);

  test('should get space media entity for a given date from the repository',
      () async {
    when(() => repository.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Right(tSpaceMedia));
    final result = await usecase(tDate);
    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test('should return a ServerFailure when don\'t sucessed',
        //Arrange
          () async {
        when(() => repository.getSpaceMediaFromDate(tDate))
            .thenAnswer((_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));
        //Act
        final result = await usecase(tDate);
        //Assert
        expect(result, Left(ServerFailure()));
        verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
      });
}
