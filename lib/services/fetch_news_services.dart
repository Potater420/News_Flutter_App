import 'package:dio/dio.dart';

class FetchNewsServices {
  final Dio dio = Dio();

  Future<List<dynamic>> newsList() async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          'q': 'general',
          'apiKey': 'a707b29a224f4478b84502b255009395',
        },
      );
      print(response.data['articles'].toString());
      print(response.data);
      return response.data['articles'] ?? [];
    } catch (e) {
      print(e.toString());
      return [];
    }
    //add try , catch later
  }
}
