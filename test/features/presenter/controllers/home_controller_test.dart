import 'package:clean_app/core/errors/failures.dart';
import 'package:clean_app/features/domain/entities/space_media_entity.dart';
import 'package:clean_app/features/domain/usecase/get_space_media_from_date_usecases.dart';
import 'package:clean_app/features/presenter/controllers/home_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/date_mock.dart';
import '../../../mocks/space_media_entity_mock.dart';

class MockGetSpaceMediaFromDateUsecase extends Mock
    implements GetSpaceMediaFromDateUsecase {}

void main() {
  late HomeController homeController;
  late GetSpaceMediaFromDateUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDateUsecase();
    homeController = HomeController(mockUsecase);
    registerFallbackValue<DateTime>(DateTime(0, 0, 0));
  });

  test('should return a SpaceMedia from the usecase', () async {
    when(() => mockUsecase(any()))
        .thenAnswer((_) async => Right(tSpaceMediaEntity));

    await homeController.getSpaceMediaFromDate(tDate);

    homeController.observer(onState: (state) {
      expect(state, tSpaceMediaEntity);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });

  final tFailure = ServerFailure();

  test('should return a Failure from the usecase when there is an error ',
      () async {
    when(() => mockUsecase(any())).thenAnswer((_) async => Left(tFailure));

    await homeController.getSpaceMediaFromDate(tDate);

    homeController.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockUsecase(tDate)).called(1);
    });
  });
}
