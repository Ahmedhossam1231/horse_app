import 'package:flutter/material.dart';


class DailyLogScreen extends StatelessWidget {
  const DailyLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController foodController = TextEditingController();
    final TextEditingController exerciseController = TextEditingController();
    final TextEditingController healthController = TextEditingController();
    final TextEditingController notesController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("تسجيل بيانات اليوم"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: foodController,
              decoration: const InputDecoration(labelText: "التغذية"),
            ),
            TextField(
              controller: exerciseController,
              decoration: const InputDecoration(labelText: "التمارين"),
            ),
            TextField(
              controller: healthController,
              decoration: const InputDecoration(labelText: "الحالة الصحية"),
            ),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(labelText: "ملاحظات أخرى"),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Store data (مثلاً في local DB أو Firebase لاحقًا)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم حفظ البيانات")),
                );
              },
              child: const Text("حفظ"),
            )
          ],
        ),
      ),
    );
  }
}
