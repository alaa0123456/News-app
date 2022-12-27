// 0cfc5c6656e24b3ebc608d507561346a

import 'package:dio/dio.dart';
import 'package:flutter_application_1/constants/strings.dart';

class ArticleService {
  late Dio dio;
  late BaseOptions options;
  ArticleService() {
    options = BaseOptions(
     baseUrl: baseUrl,
     receiveDataWhenStatusError: true,
     );
    dio = Dio(options);
  }
  Future<List<dynamic>> getArticles( var category) async {
    Response response=await dio.get('v2/top-headlines', queryParameters: {
      'country': 'gb',
      'category':category,
      'apiKey': '0cfc5c6656e24b3ebc608d507561346a'
    });
    return response.data['articles'];
  }
}
