import 'package:clean_app/core/http_client/http_client.dart';
import 'package:dio/dio.dart';

class HttpClientImplementation implements HttpClient{

  @override
  Future<HttpResponse> get(String url) async {
    final response = await Dio().get(url);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body}) {
    throw UnimplementedError();
  }

}