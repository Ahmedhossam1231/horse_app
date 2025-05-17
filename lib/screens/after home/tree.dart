import 'package:flutter/material.dart';
import 'package:login_ui_flutter/screens/after%20home/Enter_data.dart';

class FamilyTreeScreen extends StatelessWidget {
  final List<Map<String, String>> generations = [
    {}, // جيل الأول
    {}, // جيل الثاني
    {}, // جيل الثالث
    {}, // جيل الرابع
    {}, // جيل الخامس
    {}, // جيل السادس
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Tree"),
        backgroundColor:                const Color.fromARGB(255, 163, 166, 173),

      ),
      body: ListView.builder(
        itemCount: generations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.family_restroom),
              title: Text("Generation ${index + 1}"),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FamilyTreeEntryScreen(
                      parentName: "Parent of Generation ${index + 1}",
                      generation: index + 1,
                    ),
                  ),
                );

                if (result != null) {
                  // Save the data to generations list
                  generations[index] = result;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Data Saved for Generation ${index + 1}")),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
