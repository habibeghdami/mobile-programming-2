import 'package:flutter/material.dart';

class Exercise2Screen extends StatefulWidget {
  const Exercise2Screen({super.key});

  @override
  State<Exercise2Screen> createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  final gradeController = TextEditingController();
  final List<double> grades = [];

  double average = 0.0;
  int passedCount = 0;

  void calculate() {
    if (grades.isEmpty) return;

    double sum = 0.0;
    int count = 0;

    for (var grade in grades) {
      sum += grade;
      if (grade > 10) {
        count++;
      }
    }

    average = sum / grades.length;
    passedCount = count;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تمرین ۲: نمرات'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: gradeController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'نمره را وارد کنید',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (gradeController.text.isNotEmpty) {
                        setState(() {
                          double? val = double.tryParse(gradeController.text);
                          if (val != null) {
                            grades.add(val);
                            calculate();
                          }
                          gradeController.clear();
                        });
                      }
                    },
                    child: const Text('افزودن نمره'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              if (grades.isNotEmpty) ...[
                Text('میانگین نمرات: ${average.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Text('تعداد نمرات بالای ۱۰: $passedCount نفر', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                const Divider(),
              ],
              Expanded(
                child: ListView.builder(
                  itemCount: grades.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text('${index + 1}'),
                      title: Text('نمره: ${grades[index]}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
