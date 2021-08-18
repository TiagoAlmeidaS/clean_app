import 'dart:io';

import 'package:clean_app/core/errors/exception.dart';
import 'package:clean_app/core/http_client/http_client.dart';
import 'package:clean_app/core/utils/converters/date_to_string_converter.dart';
import 'package:clean_app/features/data/datasources/nasa_datasource_implementation.dart';
import 'package:clean_app/features/data/datasources/space_media_datasource.dart';
import 'package:clean_app/features/data/models/space_media_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDataSource dataSource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    dataSource = NasaDatasourceImplementation(client: client);
  });

  final tDateTime = DateTime(2021, 07, 07);
  final urlExpected = "https://api.nasa.gov/planetary/apod?api key=DEMO KEY&date=2021-07-07";
  DateToStringConverter.converter(tDateTime);

  void sucessMock() {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  test('should call the get method with corret url', () async {
    sucessMock();

    await dataSource.getSpaceMediaFromDate(tDateTime);

    verify(() => client.get(urlExpected)).called(1);
  });

  test('should return a SpaceMediaModel when is successful', () async {
    sucessMock();
    final tSpaceMediaModelExpected = SpaceMediaModel(
        explanation: "Meteoros estão caindo conforme o tempo vão passando. Um dia será feito algo incrível e niguém vera o irá acontencer, ao não ser que isso seja tudo metafóricamente hehehhehe",
        mediaType: "image",
        title: "A cor do céu é azul",
        mediaUrl: "https://canseiessaéaultimacoisaqueestoudigitandoparaessetrecochato");


    final result = await dataSource.getSpaceMediaFromDate(tDateTime);

    expect(result, tSpaceMediaModelExpected);
  });


  test('should throw a ServerExpection when the call is unsuccessful successful', () async {

    when(() => client.get(any())).thenAnswer((invocation) async => HttpResponse(data: 'something went wrong', statusCode: 400));

    final result = dataSource.getSpaceMediaFromDate(tDateTime);

    expect(() => result, throwsA(ServerException));
  });
}