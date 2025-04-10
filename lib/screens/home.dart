//import 'dart:js_interop';

import 'package:flutter/material.dart';
//import 'package:login_ui_flutter/main.dart';
import 'package:login_ui_flutter/screens/horse_screen.dart';
import 'package:login_ui_flutter/screens/profile_screen.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List<Widget> bottomNavigationBar = [
    const Home(),
    // هنا ممكن تضيف شاشة الخيل
  const Horse(),
    // هنا ممكن تضيف شاشة البروفايل
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), // تحديد ارتفاع الـ AppBar
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 67, 84, 127),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center, // لتوسيط النص
            children: [
              Text(
                "Home", // النص داخل الـ AppBar
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          actions: [
            // إضافة أيقونة qr على اليمين
            IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.qr_code_scanner, size: 40.0),
              ),
              onPressed: () {
                print("QR Icon clicked");
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Text("${bottomNavigationBar[currentIndex]}"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 67, 84, 127),
        child: const Icon(
          Icons.arrow_drop_up,
          color: Colors.white,
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
          // تنفيذ الإجراءات عند الضغط على الأيقونات
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Horse()),
            );
            print("Horse Icon Pressed");
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
              
            );
            print("Profile Icon Pressed");
          }
        },
        backgroundColor: const Color.fromARGB(255, 67, 84, 127),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "horse"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
