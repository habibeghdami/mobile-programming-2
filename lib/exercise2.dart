import 'package:flutter/material.dart';

class Exercise2Screen extends StatefulWidget {
  const Exercise2Screen({super.key});

  @override
  State<Exercise2Screen> createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  final yearController = TextEditingController();
  int birthYear = 0;
  int age = 0;
  bool calculated = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تمرین ۲'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: yearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'سال تولد (مثلا ۱۳۸۲)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    birthYear = int.parse(yearController.text);
                    age = 1403 - birthYear;
                    calculated = true;
                  });
                },
                child: const Text('محاسبه سن'),
              ),
              const SizedBox(height: 20),
              if (calculated) ...[
                Text('سال تولد: $birthYear', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('سن شما: $age سال', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
