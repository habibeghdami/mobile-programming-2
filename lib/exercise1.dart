import 'package:flutter/material.dart';

class Exercise1Screen extends StatefulWidget {
  const Exercise1Screen({super.key});

  @override
  State<Exercise1Screen> createState() => _Exercise1ScreenState();
}

class _Exercise1ScreenState extends State<Exercise1Screen> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();

  String name = '';
  String lastName = '';
  String phone = '';
  String age = '';
  bool showData = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تمرین ۱'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'نام',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: 'نام خانوادگی',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'شماره تلفن',
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
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = nameController.text;
                    lastName = lastNameController.text;
                    phone = phoneController.text;
                    age = ageController.text;
                    showData = true;
                  });
                },
                child: const Text('ثبت اطلاعات'),
              ),
              const SizedBox(height: 20),
              if (showData) ...[
                Text('نام: $name', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('نام خانوادگی: $lastName', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('شماره تماس: $phone', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('سن: $age', style: const TextStyle(fontSize: 16)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
