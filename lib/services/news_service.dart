import 'package:dio/dio.dart';
import 'package:merdeka_app/model/NewsResponse.dart';

class NewsService{

  static Future<List<Articles>?> getNews() async{
    try{
      final dio = Dio();

      var apiKey = "6259472dcef04116b2387b9e17d224b9";
      var category = "sports";
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=$apiKey&category=$category',
      );

      var newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } on DioException catch (exc){
      String errorMessage = exc.response?.data["message"] ?? "Error";
      throw errorMessage;
    }
  }

}