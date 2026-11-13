import 'package:flutter/material.dart';

class Exercise3Screen extends StatefulWidget {
  const Exercise3Screen({super.key});

  @override
  State<Exercise3Screen> createState() => _Exercise3ScreenState();
}

class _Exercise3ScreenState extends State<Exercise3Screen> {
  final itemController = TextEditingController();
  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تمرین ۳'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: itemController,
                      decoration: const InputDecoration(
                        labelText: 'نام کالا',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (itemController.text.isNotEmpty) {
                        setState(() {
                          items.add(itemController.text);
                          itemController.clear();
                        });
                      }
                    },
                    child: const Text('افزودن'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text('${index + 1}'),
                      title: Text(items[index]),
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
