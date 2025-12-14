import 'package:flutter/material.dart';
import 'dart:math';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.purple;
  final Random _random = Random();

  void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  void _resetColor() {
    setState(() {
      _backgroundColor = Colors.purple;
    });
  }

  String get colorName {
    // Tên màu đơn giản (tùy chọn)
    if (_backgroundColor == Colors.purple) return 'Tím';
    return '#${_backgroundColor.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ứng dụng Đổi màu nền')),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Màu hiện tại',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                colorName,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _changeColor,
                    icon: const Icon(Icons.color_lens),
                    label: const Text('Đổi màu'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _resetColor,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Đặt lại'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
