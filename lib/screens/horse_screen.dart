import 'package:flutter/material.dart';

class Horse extends StatefulWidget {
  const Horse({super.key});

  static const gridData = [
    'Sire\'s side GrandFather',
    'Sire\'s side GrandFather',
    'Dam\'s side GrandFather',
    'Dam\'s side GrandFather',
  ];

  @override
  _HorseState createState() => _HorseState();
}

class _HorseState extends State<Horse> {
  // Variables to store the data input from the user
  TextEditingController nameController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 84, 127),
        title: const Text("Profile Screen"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Set background color to white
          Container(
            color: const Color.fromARGB(255, 98, 141, 166),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CustomScrollView(
              slivers: [
                // Move the camera image down a bit
                SliverToBoxAdapter(
                  child: SizedBox(height: 50), // Adding some space above the image
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                    height: MediaQuery.sizeOf(context).width * 0.25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:  const Color.fromARGB(255, 67, 84, 127),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        size: MediaQuery.sizeOf(context).width * 0.15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 35),
                ),
                // Details widget with text fields
                DetailsWidget(
                  details: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailItem(
                        header: 'Name',
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'Gender',
                        child: TextField(
                          controller: genderController,
                          decoration: InputDecoration(
                            hintText: 'Enter Gender',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'Date of Birth',
                        child: TextField(
                          controller: birthDateController,
                          decoration: InputDecoration(
                            hintText: 'Enter Date of Birth',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'Country of Birth',
                        child: TextField(
                          controller: countryOfBirthController,
                          decoration: InputDecoration(
                            hintText: 'Enter the country',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'Color',
                        child: TextField(
                          controller: colorController,
                          decoration: InputDecoration(
                            hintText: 'Enter the color',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                // Rest of the details, including text fields for the other fields
                DetailsWidget(
                  details: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailItem(
                        header: 'Breed',
                        child: TextField(
                          controller: breedController,
                          decoration: InputDecoration(
                            hintText: 'Enter Breed',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'Owner',
                        child: TextField(
                          controller: ownerController,
                          decoration: InputDecoration(
                            hintText: 'Enter Owner',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'National ID',
                        child: TextField(
                          controller: nationalIdController,
                          decoration: InputDecoration(
                            hintText: 'Enter National ID',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'Medical or Health Notes',
                        child: TextField(
                          controller: medicalNotesController,
                          decoration: InputDecoration(
                            hintText: 'Enter Notes',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                      DetailItem(
                        header: 'Stable Location',
                        child: TextField(
                          controller: stableLocationController,
                          decoration: InputDecoration(
                            hintText: 'Enter Stable Location',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                // Add more fields similarly
              ],
            ),
          ),
          Positioned(
            bottom: 30,  // Adjust the position of the buttons from the bottom
            left: 28,
            right: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Edit button
                ElevatedButton(
                  onPressed: () {
                    // Handle Edit functionality here
                    print('Edit Button Pressed');
                  },
                  child: const Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 141, 166),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
                // Delete button
                ElevatedButton(
                  onPressed: () {
                    // Handle Delete functionality here
                    print('Delete Button Pressed');
                  },
                  child: const Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  const Color.fromARGB(255, 98, 141, 166),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.header,
    required this.child,
  });

  final String header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        child,
      ],
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.details,
  });

  final Widget details;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 67, 84, 127),
        ),
        child: details,
      ),
    );
  }
}
