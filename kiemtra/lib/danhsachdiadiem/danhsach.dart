import 'package:flutter/material.dart';
import 'Hotelcart.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildFilterBar(),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                HotelCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                  breakfast: true,
                  name: "aNhill Boutique",
                  score: "9.5",
                  scoreText: "Xuất sắc",
                  review: "95 đánh giá",
                  location: "Huế · Cách bạn 0,6km",
                  roomInfo: "1 suite riêng tư · 1 giường",
                  price: "US\$109",
                ),
                HotelCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                  breakfast: true,
                  name: "aNhill Boutique",
                  score: "9.5",
                  scoreText: "Xuất sắc",
                  review: "95 đánh giá",
                  location: "Huế · Cách bạn 0,6km",
                  roomInfo: "1 suite riêng tư · 1 giường",
                  price: "US\$109",
                ),
                HotelCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                  breakfast: true,
                  name: "aNhill Boutique",
                  score: "9.5",
                  scoreText: "Xuất sắc",
                  review: "95 đánh giá",
                  location: "Huế · Cách bạn 0,6km",
                  roomInfo: "1 suite riêng tư · 1 giường",
                  price: "US\$109",
                ),
                HotelCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                  breakfast: true,
                  name: "aNhill Boutique",
                  score: "9.5",
                  scoreText: "Xuất sắc",
                  review: "95 đánh giá",
                  location: "Huế · Cách bạn 0,6km",
                  roomInfo: "1 suite riêng tư · 1 giường",
                  price: "US\$109",
                ),
                HotelCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                  breakfast: true,
                  name: "aNhill Boutique",
                  score: "9.5",
                  scoreText: "Xuất sắc",
                  review: "95 đánh giá",
                  location: "Huế · Cách bạn 0,6km",
                  roomInfo: "1 suite riêng tư · 1 giường",
                  price: "US\$109",
                ),
                HotelCard(
                  imageUrl:
                      "https://images.unsplash.com/photo-1566073771259-6a8506099945",
                  breakfast: true,
                  name: "aNhill Boutique",
                  score: "9.5",
                  scoreText: "Xuất sắc",
                  review: "95 đánh giá",
                  location: "Huế · Cách bạn 0,6km",
                  roomInfo: "1 suite riêng tư · 1 giường",
                  price: "US\$109",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Xung quanh vị trí hiện tại",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 2),
          Text(
            "23 thg 10 – 24 thg 10",
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade700,
    );
  }

  Widget _buildFilterBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _FilterItem(icon: Icons.sort, label: "Sắp xếp"),
          _FilterItem(icon: Icons.tune, label: "Lọc"),
          _FilterItem(icon: Icons.map, label: "Bản đồ"),
        ],
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FilterItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
