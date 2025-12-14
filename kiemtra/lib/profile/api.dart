import 'package:dio/dio.dart';
import 'package:kiemtra/api/model/Product.dart';
import 'package:kiemtra/profile/user.dart';
import 'package:kiemtra/profile/article.dart';

class Api {
  Future<List<Product>> getAllProduct() async {
    var url = "https://fakestoreapi.com/products";
    var dio = Dio();
    var response = await dio.request(url);
    List<Product> ds = [];
    if (response.statusCode == 200) {
      List data = response.data;
      ds = data.map((json) => Product.fromJson(json)).toList();
    } else {
      print('Err call API!!!');
    }
    return ds;
  }

  Future<List<Article>> fetchArticles() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1c8c4107a3c84f51806bce8937cbfa28";
    var dio = Dio();
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;

      List articlesJson = data["articles"];
      return articlesJson.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load articles");
    }
  }

  Future<User> fetchLogin(String username, String password) async {
    const url = "https://dummyjson.com/auth/login";
    var dio = Dio();

    try {
      final response = await dio.post(
        url,
        data: {"username": username, "password": password},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        // Convert JSON to User model
        return User.fromJson(data);
      } else {
        throw Exception("Failed to login");
      }
    } catch (e) {
      throw Exception("Login error: $e");
    }
  }
}

var test_api = Api();
