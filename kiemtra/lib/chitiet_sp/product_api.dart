import 'package:dio/dio.dart';
import 'product_model.dart';

class ProductAPI {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      // Gọi đường dẫn API sản phẩm
      final response = await _dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        // API trả về object dạng: { "products": [ ...mảng dữ liệu... ], "total": ... }
        // Nên ta phải lấy key ['products']
        final List<dynamic> rawData = response.data['products'];
        
        // Map từng phần tử JSON thành object Product
        return rawData.map((e) => Product.fromJson(e)).toList();
      } else {
        print('Lỗi Server: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Lỗi kết nối: $e');
      return [];
    }
  }
}

// Tạo biến global để dùng chung
final productApi = ProductAPI();