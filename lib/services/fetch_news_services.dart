import 'package:dio/dio.dart';

class FetchNewsServices {
  final Dio dio = Dio();

  Future<List<dynamic>> newsList() async {
    Response response = await dio.get(
      'https://newsapi.org/v2/everything',
      queryParameters: {
        'q': 'general',
        'apiKey': 'a707b29a224f4478b84502b255009395',
      },
    );
    return response.data['articles']??[];    //add try , catch later
  }
}
