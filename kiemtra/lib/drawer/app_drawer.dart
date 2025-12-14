// lib/app_drawer.dart
import 'package:flutter/material.dart';
import '../dangnhap/form_dn.dart';
import '../danhsachdiadiem/danhsach.dart';
import '../booking/booking.dart';
import "../auto/main0.dart";
import '../auto/main1.dart';
import '../auto/main2.dart';
import '../dangki/form.dart';
import '../product_api/home_screens.dart';
import '../profile/FormLogin.dart';
import '../chitiet_sp/product_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  // Định nghĩa danh sách các bài (mục menu)
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Bài 1.a: Danh sách địa điểm đơn giản','widget': HotelListScreen()},
    {'title': 'Bài 1.b: Danh sách địa điểm phức tạp','widget': BookingScreen()},
    {'title': 'Bài 2.a: Bộ chuyển đồi màu', 'widget': ColorChangerScreen()},
    {'title': 'Bài 2.b: Ứng dụng đếm số', 'widget': CounterApp()},
    {'title': 'Bài 2.c: Bộ đếm thời gian', 'widget': CountdownScreen()},
    {'title': 'Bài 3.a: Đăng kí', 'widget': FormScreen()},
    {'title': 'Bài 3.b: Đăng nhập', 'widget': FormScreenDN()},
    {'title': 'Bài 4: Home product', 'widget': HomeScreen()},
    {'title': 'Bài 5: Chi tiết product', 'widget': ProductListScreen()},
    {'title': 'Bài 6: Profile', 'widget': FormLogin()},
    // Thêm các bài khác của bạn vào đây
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Rất quan trọng: Loại bỏ padding mặc định của ListView
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Header của Drawer (Tùy chọn)
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu Các Bài',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          // Tạo các mục menu từ danh sách
          ...menuItems.map((item) {
            return ListTile(
              leading: const Icon(Icons.article), // Icon tùy chọn
              title: Text(item['title']),
              onTap: () {
                // 1. Đóng Drawer trước
                Navigator.pop(context);

                // 2. Điều hướng đến màn hình nội dung tương ứng
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => item['widget'] as Widget,
                  ),
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
