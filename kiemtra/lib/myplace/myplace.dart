import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Place'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return SingleChildScrollView(
      child: Column(children: [block1(), block2(), block3(), block4()]),
    );
  }

  Widget block1() {
    var src =
        "https://images.unsplash.com/photo-1559586616-361e18714958?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Image.network(src);
  }

  Widget block2() {
    var title = "Hoang mạc Sahara";
    var subTitle = "Châu Phi";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(subTitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.red),
              SizedBox(width: 4),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Column(
          children: [
            Icon(Icons.phone, color: Colors.blue),
            Text("CALL"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.near_me, color: Colors.blue),
            Text("ROUTE"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            Text("SHARE"),
          ],
        ),
      ],
    );
  }

  Widget block4() {
    var content =
        "Sahara (tiếng Ả Rập: الصحراء الكبرى, aṣ-Ṣaḥrāʾ al-Kubrā , nghĩa là sa mạc lớn) là sa mạc lớn nhất trên Trái Đất, là hoang mạc lớn thứ 3 trên Trái Đất (sau Châu Nam Cực và Bắc Cực), với diện tích hơn 9.000.000 km², xấp xỉ diện tích của Hoa Kỳ và Trung Quốc. Sahara ở phía bắc châu Phi và có tới 2,5 triệu năm tuổi.";
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "Sahara (tiếng Ả Rập: الصحراء الكبرى, aṣ-Ṣaḥrāʾ al-Kubrā , nghĩa là sa mạc lớn) là sa mạc lớn nhất trên Trái Đất, là hoang mạc lớn thứ 3 trên Trái Đất (sau Châu Nam Cực và Bắc Cực), với diện tích hơn 9.000.000 km², xấp xỉ diện tích của Hoa Kỳ và Trung Quốc. Sahara ở phía bắc châu Phi và có tới 2,5 triệu năm tuổi.",
      ),
    );
  }
}
