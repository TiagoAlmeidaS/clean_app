import 'package:clean_app/core/errors/exception.dart';
import 'package:clean_app/core/errors/failures.dart';
import 'package:clean_app/features/data/datasources/space_media_datasource.dart';
import 'package:clean_app/features/data/models/space_media_model.dart';
import 'package:clean_app/features/data/repositories/space_media_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDataSource extends Mock implements ISpaceMediaDataSource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDataSource dataSource;

  setUp(() {
    dataSource = MockSpaceMediaDataSource();
    repository = SpaceMediaRepositoryImplementation(dataSource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
      explanation: "lala",
      mediaType: "media",
      title: "Primeiro teste",
      mediaUrl:
          "https://canseiessaéaultimacoisaqueestoudigitandoparaessetrecochato");

  final tDate = DateTime(2021, 02, 02);

  test('should return space media model when calls the datasource', () async {
    //Arrange
    when(() => dataSource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);

    //Act
    final result = await repository.getSpaceMediaFromDate(tDate);

    //Assert
    expect(result, Right(tSpaceMediaModel));
    verify(() => dataSource.getSpaceMediaFromDate(tDate)).called(1);
  });

  test(
      'should return a server failure when calls to datasource is unsuccesfull',
      () async {
    //Arrange
    when(() => dataSource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException());

    //Act
    final result = await repository.getSpaceMediaFromDate(tDate);

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => dataSource.getSpaceMediaFromDate(tDate)).called(1);
  });
}
