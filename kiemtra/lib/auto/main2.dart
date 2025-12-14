import 'dart:async';
import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  TextEditingController secondsController = TextEditingController();
  Timer? timer;
  int remainingSeconds = 0;
  bool isCounting = false;

  void startTimer() {
    if (secondsController.text.isEmpty) return;

    setState(() {
      remainingSeconds = int.tryParse(secondsController.text) ?? 0;
      isCounting = true;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        t.cancel();
        setState(() {
          isCounting = false;
        });
      }
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      isCounting = false;
      remainingSeconds = 0;
      secondsController.clear();
    });
  }

  String formatTime(int seconds) {
    int m = seconds ~/ 60;
    int s = seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2F9),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("⏳ Bộ đếm thời gian"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text("Nhập số giây cần đếm:", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            TextField(
              controller: secondsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "30",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Text(
              formatTime(remainingSeconds),
              style: const TextStyle(
                fontSize: 45,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isCounting ? null : startTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: const Text("Bắt đầu"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: resetTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade500,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: const Text("Đặt lại"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
