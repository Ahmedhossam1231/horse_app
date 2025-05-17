import 'package:flutter/material.dart';

class Horse extends StatefulWidget {
  final String? horseName; // ممكن يبقى فاضي لو بضيف حصان جديد

  const Horse({Key? key, this.horseName}) : super(key: key);

  @override
  _HorseState createState() => _HorseState();
}

class _HorseState extends State<Horse> {
  // Controllers
  late TextEditingController nameController;
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController coatController = TextEditingController();
  TextEditingController medicalNotesController = TextEditingController();
  TextEditingController countryOfBirthController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController stableLocationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.horseName ?? "");

    // لو جالي حصان موجود - ممكن تهيأ الداتا هنا
    if (widget.horseName != null) {
      // هنا مؤقتًا بنعمل بيانات وهمية، بعدين هتربطها بالباك اند
      genderController.text = "Male";
      birthDateController.text = "01/01/2020";
      breedController.text = "Arabian";
      coatController.text = "White";
      medicalNotesController.text = "Healthy";
      countryOfBirthController.text = "UAE";
      colorController.text = "White";
      ownerController.text = "Ahmed";
      nationalIdController.text = "123456789";
      stableLocationController.text = "Dubai Stable";
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    breedController.dispose();
    coatController.dispose();
    medicalNotesController.dispose();
    countryOfBirthController.dispose();
    colorController.dispose();
    ownerController.dispose();
    nationalIdController.dispose();
    stableLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 163, 166, 173),

        title: Text(widget.horseName != null ? "Horse Profile" : "Add New Horse"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: const Color.fromARGB(255, 255, 255, 255)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 50),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      height: MediaQuery.sizeOf(context).width * 0.25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
          color: const Color.fromARGB(255, 163, 166, 173),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // هنا تضيف الكاميرا لو حابب
                        },
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          size: MediaQuery.sizeOf(context).width * 0.15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 35),
                ),
                DetailsWidget(
                  details: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildField('Name', nameController),
                      buildField('Gender', genderController),
                      buildField('Date of Birth', birthDateController),
                      buildField('Country of Birth', countryOfBirthController),
                      buildField('Color', colorController),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                DetailsWidget(
                  details: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildField('Breed', breedController),
                      buildField('Owner', ownerController),
                      buildField('National ID', nationalIdController),
                      buildField('Medical or Health Notes', medicalNotesController),
                      buildField('Stable Location', stableLocationController),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 28,
            right: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Edit Button Pressed');
                    // هنا ممكن تضيف حفظ للتعديلات
                  },
                  child: const Text('delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Delete Button Pressed');
                    // هنا تحط حذف الحصان
                  },
                  child: const Text('save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildField(String header, TextEditingController controller) {
    return DetailItem(
      header: header,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter $header',
          hintStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    Key? key,
    required this.header,
    required this.child,
  }) : super(key: key);

  final String header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          child,
        ],
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key, required this.details}) : super(key: key);

  final Widget details;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 163, 166, 173),
        ),
        child: details,
      ),
    );
  }
}
