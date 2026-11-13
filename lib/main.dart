import 'package:flutter/material.dart';
import 'exercise1.dart';
import 'exercise2.dart';
import 'exercise3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تمرین‌ها'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Exercise1Screen()),
                  );
                },
                child: const Text('تمرین ۱: وضعیت دانش‌آموز'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Exercise2Screen()),
                  );
                },
                child: const Text('تمرین ۲: نمرات و میانگین'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Exercise3Screen()),
                  );
                },
                child: const Text('تمرین ۳: بررسی رمز عبور'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
