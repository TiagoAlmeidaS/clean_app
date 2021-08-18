import 'package:clean_app/core/errors/exception.dart';
import 'package:clean_app/core/http_client/http_client.dart';
import 'package:clean_app/core/utils/converters/date_to_string_converter.dart';
import 'package:clean_app/core/utils/keys/nasa_api_keys.dart';
import 'package:clean_app/features/data/datasources/endpoints/nasa_endpoint.dart';
import 'package:clean_app/features/data/datasources/space_media_datasource.dart';
import 'package:clean_app/features/data/models/space_media_model.dart';
import 'package:dartz/dartz.dart';

class NasaDatasourceImplementation implements ISpaceMediaDataSource {
  final HttpClient client;

  NasaDatasourceImplementation({required this.client});

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndpoint.apod(NasaApiKeys.apiKey, DateToStringConverter.converter(date)));
    if(response.statusCode == 200){
      return SpaceMediaModel.fromJson(response.data);
    } else {
      throw ServerException();
    }

  }
}

