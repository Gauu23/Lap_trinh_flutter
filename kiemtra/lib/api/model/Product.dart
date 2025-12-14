import 'dart:convert';

class Product {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    price: json["price"]?.toDouble() ?? 0,
    description: json["description"] ?? "",
    category: json["category"] ?? "",
    image: json["image"] ?? "",
    rating: json["rating"] != null
        ? Rating.fromJson(json["rating"])
        : Rating(rate: 0, count: 0),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toJson(),
  };
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(rate: json["rate"]?.toDouble(), count: json["count"]);

  Map<String, dynamic> toJson() => {"rate": rate, "count": count};
}
