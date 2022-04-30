import 'package:dio/dio.dart';

class Cat {
  Future<List> meow() async {
    var response = await Dio().get('https://api.thecatapi.com/v1/breeds/',
        options: Options(
            headers: {'x-api-key': '1388090b-bec1-4ab1-b868-f8f651d2abfb'}));
    return response.data;
  }
}
