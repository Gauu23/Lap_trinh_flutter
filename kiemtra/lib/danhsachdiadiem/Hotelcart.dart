import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final bool breakfast;
  final String name;
  final String score;
  final String scoreText;
  final String review;
  final String location;
  final String roomInfo;
  final String price;
  final String? highlight;

  const HotelCard({
    super.key,
    required this.imageUrl,
    required this.breakfast,
    required this.name,
    required this.score,
    required this.scoreText,
    required this.review,
    required this.location,
    required this.roomInfo,
    required this.price,
    this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            const SizedBox(width: 10),
            Expanded(child: _buildInfo()),
          ],
        ),
      ),
    );
  }

  // ================= IMAGE =================
  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        if (breakfast)
          Positioned(
            top: 6,
            left: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                "Bao bữa sáng",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
      ],
    );
  }

  // ================= INFO =================
  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name + heart
        Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.favorite_border, size: 18),
          ],
        ),

        const SizedBox(height: 4),
        _buildScore(),

        const SizedBox(height: 4),
        Text(
          location,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),

        const SizedBox(height: 4),
        Text(roomInfo, maxLines: 2, overflow: TextOverflow.ellipsis),

        if (highlight != null) ...[
          const SizedBox(height: 4),
          Text(
            highlight!,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ],

        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  // ================= SCORE =================
  Widget _buildScore() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            score,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        const SizedBox(width: 6),
        Text(scoreText, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(width: 6),
        Text(
          "· $review",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
