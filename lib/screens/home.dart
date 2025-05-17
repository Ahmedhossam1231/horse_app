import 'package:flutter/material.dart';
import 'package:login_ui_flutter/screens/after%20home/DailyLogScreen.dart';
import 'package:login_ui_flutter/screens/after%20home/horse_book_screen.dart';
import 'package:login_ui_flutter/screens/after%20home/tree.dart';
import 'package:login_ui_flutter/screens/profile%20screens/account_screen.dart';
import 'package:login_ui_flutter/screens/profile%20screens/horse_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List<String> horses = [
    "Horse 1",
    "Horse 2",
    "Horse 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer (menu) جانبي
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6, // عرض القائمة الجانبية 60% من الشاشة
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color:const Color.fromARGB(255, 163, 166, 173),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.person_2_outlined, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            ListTile(
  leading: const Icon(Icons.note),
  title: const Text('تسجيل يوميات الحصان'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DailyLogScreen()),
    );
  },
),
ListTile(
  leading: const Icon(Icons.insights),
  title: const Text('تحليلات قادمة'),
  onTap: () {
    // شاشة مستقبلية للتحليلات أو الإحصائيات
  },
),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Navigate to settings screen
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.tree),
              title: const Text('family tree'),
              onTap: () {
                   Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>FamilyTreeScreen()),  // استدعاء شاشة FamilyTreeScreen
    );
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text('scanner'),
              onTap: () {
                // TODO: Navigate to horse list screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded),
              title: const Text('book'),
              onTap: () {
                 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>HorseBookScreen()),  // استدعاء شاشة FamilyTreeScreen
    );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // TODO: Handle logout
              },
            ),
             
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 163, 166, 173)),
          ),
          // إضافة أيقونة المينيو لفتح القائمة الجانبية
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // فتح القائمة الجانبية
              },
            ),
          ),
        ),
      ),
      body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("تسجيل بيانات اليوم", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: const Icon(Icons.note_add, color: Colors.teal),
          title: const Text("سجل اليوميات لحصانك"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DailyLogScreen()),
            );
          },
        ),
      ),
      const SizedBox(height: 20),
      const Text("آخر الخيول المضافة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      Expanded(
        child: ListView.builder(
          itemCount: horses.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.pets),
              title: Text(horses[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Horse(horseName: horses[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    ],
  ),
),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 1) {
            _showHorseList(context);
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountScreen()),
            );
            print("Profile Icon Pressed");
          }
        },
        backgroundColor: const Color.fromARGB(255, 163, 166, 173),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Horse"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile"),
        ],
      ),
    );
  }

  void _showHorseList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select a Horse",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: horses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.pets),
                    title: Text(horses[index]),
                    onTap: () {
                      Navigator.pop(context); // Close the bottom sheet
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Horse(
                            horseName: horses[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Add New Horse"),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Horse(), // Empty form
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
