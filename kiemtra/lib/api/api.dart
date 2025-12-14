import 'package:dio/dio.dart';
import 'package:kiemtra/api/model/Product.dart';

class API {
  static Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var response = await dio.get('https://fakestoreapi.com/products');
    List<Product> lsProduct = [];
    if (response.statusCode == 200) {
      List ls = response.data;
      lsProduct = ls.map((json) => Product.fromJson(json)).toList();
    } else {
      print("Lỗi!");
    }
    return lsProduct;
  }

  Future<List<String>> getCategories() async {
    var dio = Dio();
    var response = await dio.get(
      'https://fakestoreapi.com/products/categories',
    );
    if (response.statusCode == 200) {
      List list = response.data;
      return list.map<String>((e) => e.toString()).toList();
    }
    return [];
  }
}
