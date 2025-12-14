import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kiemtra/api/model/NewResponse.dart';

class NewsApi {
  // URL giống hệt URL bạn test trong Postman
  static const String url =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=0d935de25e064796ab0fbfac6d9d3d18";

  Future<NewsResponse?> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return NewsResponse.fromJson(jsonData);
      } else {
        print("API Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }

    return null;
  }
}
