class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  // Factory để chuyển đổi JSON từ API thành Object Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? '',
      // Dùng (json['x'] as num?)?.toDouble() để an toàn cho cả int và double
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? 'General',
      thumbnail: json['thumbnail'] ?? '',
      // Kiểm tra null cho danh sách ảnh
      images: json['images'] != null 
          ? List<String>.from(json['images']) 
          : [],
    );
  }
}