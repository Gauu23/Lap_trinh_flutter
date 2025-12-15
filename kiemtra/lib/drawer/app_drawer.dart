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
import '../classrom/my_classrom.dart';
import '../myhomepage/my_home_page.dart';
import '../myplace/myplace.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  // Định nghĩa danh sách các bài (mục menu)
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Bài 1.a: My Homepage',
      'icon': Icons.home,
      'widget': MyHomePage(),
    },
    {'title': 'Bài 1.b: My Place', 'icon': Icons.place, 'widget': MyPlace()},
    {
      'title': 'Bài 2: Classroom',
      'icon': Icons.school,
      'widget': MyClassroom(),
    },
    {
      'title': 'Bài 3.a: Danh sách địa điểm đơn giản',
      'icon': Icons.list,
      'widget': HotelListScreen(),
    },
    {
      'title': 'Bài 3.b: Danh sách địa điểm phức tạp',
      'icon': Icons.book_online,
      'widget': BookingScreen(),
    },
    {
      'title': 'Bài 4.a: Bộ chuyển đồi màu',
      'icon': Icons.color_lens,
      'widget': ColorChangerScreen(),
    },
    {
      'title': 'Bài 4.b: Ứng dụng đếm số',
      'icon': Icons.calculate,
      'widget': CounterApp(),
    },
    {
      'title': 'Bài 4.c: Bộ đếm thời gian',
      'icon': Icons.timer,
      'widget': CountdownScreen(),
    },
    {
      'title': 'Bài 5.a: Đăng kí',
      'icon': Icons.person_add,
      'widget': FormScreen(),
    },
    {
      'title': 'Bài 5.b: Đăng nhập',
      'icon': Icons.login,
      'widget': FormScreenDN(),
    },
    {
      'title': 'Bài 6: Home product',
      'icon': Icons.shopping_bag,
      'widget': HomeScreen(),
    },
    {
      'title': 'Bài 7: Chi tiết product',
      'icon': Icons.info,
      'widget': ProductListScreen(),
    },
    {
      'title': 'Bài 8: Profile',
      'icon': Icons.account_circle,
      'widget': FormLogin(),
    },
    // Thêm các bài khác của bạn vào đây
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school, size: 40, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu Các Bài',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Flutter Exercises',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ...menuItems.map((item) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon'], color: Colors.blueAccent),
                    title: Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => item['widget'] as Widget,
                        ),
                      );
                    },
                  ),
                  if (item != menuItems.last)
                    const Divider(height: 1, color: Colors.blueGrey),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
