import 'package:flutter/material.dart';
import 'package:login_ui_flutter/screens/after%20home/Enter_data.dart';

class FamilyTreeScreen extends StatefulWidget {
  const FamilyTreeScreen({super.key});

  @override
  State<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends State<FamilyTreeScreen> {
  final List<Map<String, String>> generations = List.generate(6, (_) => {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Family Tree"),
        backgroundColor: const Color.fromARGB(255, 163, 166, 173),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: generations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: ListTile(
                leading: const Icon(Icons.family_restroom, color: Color.fromARGB(255, 163, 166, 173), size: 36),
                title: Text(
                  "gen  ${index + 1}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                onTap: () async {
                  final result = await Navigator.push<Map<String, String>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FamilyTreeEntryScreen(
                        parentName: "  ${index + 1}",
                        generation: index + 1,
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      generations[index] = result;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("تم حفظ بيانات الجيل ${index + 1}")),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
