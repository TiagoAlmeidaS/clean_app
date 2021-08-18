import 'package:clean_app/core/errors/failures.dart';
import 'package:clean_app/features/domain/entities/space_media_entity.dart';
import 'package:clean_app/features/domain/usecase/get_space_media_from_date_usecases.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeController extends NotifierStore<Failure, SpaceMediaEntity> {
  final GetSpaceMediaFromDateUsecase usecase;

  HomeController(this.usecase)
      : super(SpaceMediaEntity(
            explanation: "", mediaType: "", title: "", mediaUrl: ""));

  getSpaceMediaFromDate(DateTime date) async {
    //resumo usando flutter_triple
    executeEither(() => usecase(date));
    // setLoading(true);
    // final result = await usecase(date);
    // result.fold((error) => setError(error), (success) => update(success));
    // setLoading(false);
  }
}
