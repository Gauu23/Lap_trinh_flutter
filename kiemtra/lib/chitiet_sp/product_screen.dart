import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'product_api.dart';
import 'product_model.dart';

// --- MÀN HÌNH 1: DANH SÁCH SẢN PHẨM ---
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Biến lưu trữ kết quả API
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    // Gọi API ngay khi màn hình khởi tạo
    _futureProducts = productApi.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cửa Hàng Online', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      // FutureBuilder xử lý trạng thái chờ dữ liệu
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          // 1. Đang tải
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // 2. Có lỗi
          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }
          // 3. Không có dữ liệu
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có sản phẩm nào.'));
          }

          // 4. Có dữ liệu -> Hiển thị ListView
          final products = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return _buildProductItem(context, products[index]);
            },
          );
        },
      ),
    );
  }

  // Widget vẽ từng ô sản phẩm
  Widget _buildProductItem(BuildContext context, Product product) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          // Chuyển sang màn hình chi tiết
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              // Ảnh Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.thumbnail,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 15),
              // Thông tin bên phải
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(' ${product.rating}'),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// --- MÀN HÌNH 2: CHI TIẾT SẢN PHẨM ---
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  // Hàm mở trình duyệt (Search Google theo tên sản phẩm)
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.google.com/search?q=${Uri.encodeComponent(product.title)}');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Slider ảnh (PageView)
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: product.images.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        product.images[index],
                        fit: BoxFit.contain, // Hiển thị trọn vẹn ảnh
                        errorBuilder: (_,__,___) => const Center(child: Icon(Icons.broken_image)),
                      );
                    },
                  ),
                  // Chỉ dẫn số lượng ảnh
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${product.images.length} ảnh',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Giá và danh mục
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      Chip(
                        label: Text(product.category),
                        backgroundColor: Colors.blue[50],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  
                  // Đánh giá
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(
                        ' ${product.rating} / 5.0',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(height: 30),

                  // Mô tả chi tiết
                  const Text(
                    "Mô tả sản phẩm:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                  ),
                  
                  const SizedBox(height: 30),

                  // Nút mở link (Đáp ứng yêu cầu "Mở link bài viết gốc")
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.search),
                      label: const Text('Tìm thông tin trên Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _launchURL,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}