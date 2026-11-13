import 'package:flutter/material.dart';

class Exercise6Screen extends StatefulWidget {
  const Exercise6Screen({super.key});

  @override
  State<Exercise6Screen> createState() => _Exercise6ScreenState();
}

class _Exercise6ScreenState extends State<Exercise6Screen> {
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
          title: const Text('تمرین ۶'),
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
