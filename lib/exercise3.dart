import 'package:flutter/material.dart';

class Exercise3Screen extends StatefulWidget {
  const Exercise3Screen({super.key});

  @override
  State<Exercise3Screen> createState() => _Exercise3ScreenState();
}

class _Exercise3ScreenState extends State<Exercise3Screen> {
  final passwordController = TextEditingController();
  final String correctPassword = '1234';
  String message = '';
  Color messageColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تمرین ۳: رمز عبور'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'رمز عبور را وارد کنید',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (passwordController.text == correctPassword) {
                      message = 'درست است';
                      messageColor = Colors.green;
                    } else {
                      message = 'رمز نادرست است';
                      messageColor = Colors.red;
                    }
                  });
                },
                child: const Text('بررسی رمز'),
              ),
              const SizedBox(height: 20),
              if (message.isNotEmpty)
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: messageColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
