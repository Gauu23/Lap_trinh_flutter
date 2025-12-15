import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'xinchaocacban',
            style: TextStyle(
              color: const Color.fromARGB(255, 142, 29, 29),
              fontSize: 18,
            ),
          ),
        ),
        Icon(Icons.heart_broken, size: 100, color: Colors.blue),
        Text(
          "Lop nhom 6",
          style: TextStyle(color: Colors.blueAccent, fontSize: 100),
        ),
      ],
    );
  }
}
