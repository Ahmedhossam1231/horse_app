import 'package:flutter/material.dart';
import 'package:login_ui_flutter/screens/after%20home/DailyLogScreen.dart';
import 'package:login_ui_flutter/screens/after%20home/E-commerce.dart';
import 'package:login_ui_flutter/screens/after%20home/horse_book_screen.dart';
import 'package:login_ui_flutter/screens/after%20home/ocr_scanner_screen.dart';
import 'package:login_ui_flutter/screens/after%20home/family_tree_screen.dart';
import 'package:login_ui_flutter/screens/profile%20screens/account_screen.dart';
import 'package:login_ui_flutter/screens/profile%20screens/horse_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// استيراد شاشات شجرة العائلة

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

  double slider = 150;
  int num1 = 0;
  int num2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 163, 166, 173),
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
              leading: const Icon(Icons.data_saver_off_sharp),
              title: const Text('Horse data '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DailyLogScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text(' Shop'),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HorseMarketScreen()),
                );// شاشة مستقبلية للتحليلات أو الإحصائيات
              },
            ),
           
            ListTile(
              leading: const Icon(FontAwesomeIcons.tree),
              title: const Text('family tree'),
              onTap: () {
                Navigator.push(
                  context,
                  // استدعاء شاشة شجرة العائلة الرئيسية
                  MaterialPageRoute(builder: (context) =>  FamilyTreeScreen()),

                  // إذا أردت استخدام FamilyTreeEntryScreen (تحتاج parentName):
                  // MaterialPageRoute(builder: (context) => FamilyTreeEntryScreen(parentName: "root")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text('scanner'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OcrScannerScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded),
              title: const Text('book'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HorseBookScreen()),
                );
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
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(7, (index) => buildDataContainer(index)),
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

  Widget buildDataContainer(int index) {
    // ممكن هنا تغير المحتوى حسب رقم الكونتينر لو حبيت
    // بس دلوقتي هخليهم نفس التصميم اللي بعتته لك مع اختلاف رقم بس للتمييز
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 1, 13, 42),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: index % 3 == 0
            ? Row(
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.teal,
                      onTap: () {
                        print("Container $index Male tapped");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 17, 46),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, size: 80, color: Colors.white),
                            const SizedBox(height: 10),
                            Text(
                              "Male",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.teal,
                      onTap: () {
                        print("Container $index Female tapped");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 4, 17, 46),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female, size: 80, color: Colors.white),
                            const SizedBox(height: 10),
                            Text(
                              "Female",
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : index % 3 == 1
                ? Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 17, 46),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Height",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${slider.toStringAsFixed(1)}",
                                style: const TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                ),
                              ),
                              Slider(
                                value: slider,
                                onChanged: (double x) {
                                  setState(() {
                                    slider = x;
                                  });
                                },
                                min: 75,
                                max: 250,
                                inactiveColor: Colors.white,
                                activeColor: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 17, 46),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Weight",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "$num1",
                                style: const TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    heroTag: 'weight_inc_$index',
                                    onPressed: () {
                                      setState(() {
                                        num1++;
                                      });
                                    },
                                    child: const Text(
                                      "+",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  FloatingActionButton(
                                    heroTag: 'weight_dec_$index',
                                    onPressed: () {
                                      setState(() {
                                        if (num1 > 0) num1--;
                                      });
                                    },
                                    child: const Text(
                                      "-",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 17, 46),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Age",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "$num2",
                                style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    heroTag: 'age_inc_$index',
                                    onPressed: () {
                                      setState(() {
                                        num2++;
                                      });
                                    },
                                    child: const Text(
                                      "+",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  FloatingActionButton(
                                    heroTag: 'age_dec_$index',
                                    onPressed: () {
                                      setState(() {
                                        if (num2 > 0) num2--;
                                      });
                                    },
                                    child: const Text(
                                      "-",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      Navigator.pop(context);
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
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Horse(),
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

