import 'package:kiemtra/api/api.dart';
import 'package:flutter/material.dart';
import 'package:kiemtra/api/model/Product.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    API.getAllProduct(); // gọi API đúng cách
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: API.getAllProduct(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return MyListView(snap.data!);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget MyListView(List<Product> lsProduct) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: lsProduct.map((p) => myItem(p)).toList(),
    );
  }

  Widget myItem(Product p) {
    return Text(p.title);
  }
}
