import 'dart:convert';

import 'package:clean_app/features/data/models/space_media_model.dart';
import 'package:clean_app/features/domain/entities/space_media_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/space_media_mock.dart';

void main() {

  final tSpaceMediaModel = SpaceMediaModel(
      explanation: "Meteoros estão caindo conforme o tempo vão passando. Um dia será feito algo incrível e niguém vera o irá acontencer, ao não ser que isso seja tudo metafóricamente hehehhehe",
      mediaType: "image",
      title: "A cor do céu é azul",
      mediaUrl: "https://canseiessaéaultimacoisaqueestoudigitandoparaessetrecochato");

  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  //Apenas um exemplo, pois o dados mocados precisam ser igual
  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = jsonDecode(spaceMediaMock);

    final result = SpaceMediaModel.fromJson(jsonMap);

    expect(result, tSpaceMediaModel);
  });

  //Apenas um exemplo, pois o dados mocados precisam ser igual
  test('should returna a valid jsno', () {
    var expectJson = {
      "copyright" : "Tiago Almeida",
      "date" : "2021-07-07",
      "explanation" : "Meteoros estão caindo conforme o tempo vão passando. Um dia será feito algo incrível e niguém vera o irá acontencer, ao não ser que isso seja tudo metafóricamente hehehhehe",
      "hdurl" : "https://algumacoisaaqui",
      "media_type" : "image",
      "service_version" : "v1",
      "title" : "A cor do céu é azul",
      "url" : "https://canseiessaeaultimacoisaqueestoudigitandoparaessetrecochato"
    };

    final result = tSpaceMediaModel.toJson();

    expect(result, expectJson);
  });

}