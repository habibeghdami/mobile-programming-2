import 'package:flutter/material.dart';

class Exercise4Screen extends StatefulWidget {
  const Exercise4Screen({super.key});

  @override
  State<Exercise4Screen> createState() => _Exercise4ScreenState();
}

class _Exercise4ScreenState extends State<Exercise4Screen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final gpaController = TextEditingController();

  String name = '';
  int age = 0;
  double gpa = 0.0;
  String status = '';
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تمرین ۴'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'نام دانش‌آموز',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'سن',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: gpaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'معدل',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = nameController.text;
                    age = int.tryParse(ageController.text) ?? 0;
                    gpa = double.tryParse(gpaController.text) ?? 0.0;

                    if (gpa >= 10) {
                      status = 'قبول';
                    } else {
                      status = 'مردود';
                    }
                    isSubmitted = true;
                  });
                },
                child: const Text('ثبت و بررسی'),
              ),
              const SizedBox(height: 20),
              if (isSubmitted) ...[
                Text('نام: $name', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('سن: $age', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('معدل: $gpa', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text(
                  'وضعیت: $status',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: status == 'قبول' ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
