import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Bài 1.b'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearch(),
              const SizedBox(height: 24),
              const Text(
                "Saved Places",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded(child: _buildGrid()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Text(
              "Charlie",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
      IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
    ],
  );
}

// seach
Widget _buildSearch() {
  return TextField(
    decoration: InputDecoration(
      hintText: "Search",
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

// Grid view
Widget _buildGrid() {
  final places = [
    "https://images.unsplash.com/photo-1549693578-d683be217e58",
    "https://images.unsplash.com/photo-1502602898657-3e91760cbb34",
    "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
    "https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1",
  ];

  return GridView.builder(
    itemCount: places.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
    ),
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(places[index], fit: BoxFit.cover),
      );
    },
  );
}
