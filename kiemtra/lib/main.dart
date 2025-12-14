import 'package:flutter/material.dart';
import 'drawer/app_drawer.dart';
import 'drawer/bai_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. CHUYỂN 'debugShowCheckedModeBanner: false' VÀO ĐÂY
      debugShowCheckedModeBanner: false,

      title: 'Flutter Drawer Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ... (phần code bị commented)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 2. LOẠI BỎ DÒNG LỖI VÀ THÊM DẤU PHẨY ĐỂ PHÂN TÁCH CÁC THUỘC TÍNH (NẾU CÓ)
      // debugShowCheckedModeBanner: false // <-- BỊ XÓA Ở ĐÂY
      appBar: AppBar(
        title: const Text('Kiểm tra'),
        backgroundColor: Colors.blue,
      ),

      // Gắn AppDrawer vào đây!
      // Cần thêm 'const' nếu AppDrawer là một StatelessWidget và không có tham số thay đổi
      drawer: AppDrawer(),

      // Nội dung màn hình chính (có thể là màn hình mặc định)
      body: const Center(child: Text('Chọn một bài từ Drawer')),
    );
  }
}
