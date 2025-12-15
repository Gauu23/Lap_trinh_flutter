import 'package:flutter/material.dart';

class Course {
  final String title;
  final String code;
  final int studentCount;
  final String themeAsset;

  Course({
    required this.title,
    required this.code,
    required this.studentCount,
    required this.themeAsset,
  });
}

final List<Course> mockCourses = [
  Course(
    title: "XML và ứng dụng - Nhóm 1",
    code: "2025-2026.1.TIN4583.001",
    studentCount: 58,
    themeAsset: 'medal',
  ),
  Course(
    title: "Lập trình ứng dụng cho các thiết bị di động...",
    code: "2025-2026.1.TIN4403.006",
    studentCount: 55,
    themeAsset: 'book',
  ),
  Course(
    title: "Lập trình ứng dụng cho các thiết bị di động...",
    code: "2025-2026.1.TIN4403.005",
    studentCount: 52,
    themeAsset: 'book',
  ),
  Course(
    title: "Lập trình ứng dụng cho các thiết bị di động...",
    code: "2025-2026.1.TIN4403.004",
    studentCount: 50,
    themeAsset: 'cap',
  ),
  Course(
    title: "Lập trình ứng dụng cho các thiết bị di động...",
    code: "2025-2026.1.TIN4403.003",
    studentCount: 52,
    themeAsset: 'medal',
  ),
];

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({Key? key, required this.course}) : super(key: key);

  Color _getThemeColor(String asset) {
    if (asset == 'medal') return Colors.orange.shade700;
    if (asset == 'book') return Colors.red.shade700;
    if (asset == 'cap') return Colors.blue.shade700;
    return Colors.grey.shade700;
  }

  Widget _getThemeIcon(String asset) {
    IconData icon = Icons.star;
    if (asset == 'medal') icon = Icons.emoji_events;
    if (asset == 'book') icon = Icons.book;
    if (asset == 'cap') icon = Icons.school;
    return Positioned(
      bottom: -30,
      right: -30,
      child: Icon(icon, size: 150, color: Colors.white.withOpacity(0.15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4,
      child: Container(
        // ĐÃ TĂNG CHIỀU CAO TỪ 120 LÊN 128 ĐỂ KHẮC PHỤC LỖI TRÀN 8 PIXELS
        height: 128,
        decoration: BoxDecoration(
          color: _getThemeColor(course.themeAsset),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            _getThemeIcon(course.themeAsset),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.code,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${course.studentCount} học viên",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const Positioned(
              top: 4,
              right: 4,
              child: Icon(Icons.more_horiz, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClassroom extends StatelessWidget {
  const MyClassroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Để chạy được màn hình này, cần bọc nó trong MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Classroom',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: const Text(
            'Bài 1: My Classroom',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView.builder(
          itemCount: mockCourses.length,
          itemBuilder: (context, index) {
            final course = mockCourses[index];
            return CourseCard(course: course);
          },
        ),
      ),
    );
  }
}
