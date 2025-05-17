import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class HorseMarketScreen extends StatelessWidget {
  const HorseMarketScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horse E-commerce',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: const EcommerceScreen(),
    );
  }
}

class EcommerceScreen extends StatefulWidget {
  const EcommerceScreen({Key? key}) : super(key: key);

  @override
  _EcommerceScreenState createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> horsesToSell = [
    {
      'name': 'Black Beauty',
      'price': 5000,
      'rating': 4.8,
      'image':
          'https://images.unsplash.com/photo-1535914254981-b5012eebbd15?auto=format&fit=crop&w=800&q=80',
      'description':
          'A majestic black horse known for its strength and agility.'
    },
    {
      'name': 'Seabiscuit',
      'price': 7500,
      'rating': 4.9,
      'image':
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
      'description':
          'Famous racehorse, great stamina and speed for competitions.'
    },
  ];

  List<Map<String, dynamic>> userHorses = [
    {
      'name': 'Thunder',
      'price': 6000,
      'rating': 4.7,
      'image':
          'https://images.unsplash.com/photo-1508672019048-805c876b67e2?auto=format&fit=crop&w=800&q=80',
      'description': '',
    },
    {
      'name': 'Spirit',
      'price': 5800,
      'rating': 4.5,
      'image':
          'https://images.unsplash.com/photo-1531973968078-9bb02785f9e0?auto=format&fit=crop&w=800&q=80',
      'description': '',
    },
    {
      'name': 'Silver',
      'price': 4900,
      'rating': 4.6,
      'image':
          'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?auto=format&fit=crop&w=800&q=80',
      'description': '',
    },
  ];

  late AnimationController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    // Simulate loading delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildHorseCard(Map<String, dynamic> horse, int index) {
    final animation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          (index / horsesToSell.length),
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: _controller,
        child: Card(
          elevation: 10,
          shadowColor: Colors.deepOrangeAccent.withOpacity(0.4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            splashColor: Colors.deepOrange.withOpacity(0.3),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HorseDetailScreen(horse: horse)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Hero(
                    tag: horse['name'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        horse['image'],
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(horse['name'],
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 6),
                        Text(
                          horse['description'] ?? 'No description provided.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: Colors.amber[700], size: 20),
                            const SizedBox(width: 6),
                            Text(
                              horse['rating'].toString(),
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Text(
                              '\$${horse['price']}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange[800]),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingShimmer() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      itemCount: 3,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE0B2), Color(0xFFFF6F00)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Horses Marketplace',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black45,
                          offset: Offset(1, 1),
                        )
                      ]),
                ),
              ),
              Expanded(
                child: isLoading
                    ? _buildLoadingShimmer()
                    : horsesToSell.isEmpty
                        ? Center(
                            child: Text(
                              "No horses listed for sale yet.",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: horsesToSell.length,
                            itemBuilder: (context, index) =>
                                _buildHorseCard(horsesToSell[index], index),
                          ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Add Your Horse for Sale',
                        style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 8,
                      shadowColor: Colors.deepOrangeAccent,
                    ),
                    onPressed: () async {
                      final newHorse = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SelectHorseToSellScreen(userHorses: userHorses)),
                      );
                      if (newHorse != null) {
                        setState(() {
                          horsesToSell.add(newHorse);
                          _controller.reset();
                          _controller.forward();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${newHorse['name']} is now listed for sale!',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.deepOrange[700],
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectHorseToSellScreen extends StatefulWidget {
  final List<Map<String, dynamic>> userHorses;
  const SelectHorseToSellScreen({Key? key, required this.userHorses})
      : super(key: key);

  @override
  _SelectHorseToSellScreenState createState() =>
      _SelectHorseToSellScreenState();
}

class _SelectHorseToSellScreenState extends State<SelectHorseToSellScreen>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic>? selectedHorse;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      lowerBound: 0.8,
      upperBound: 1.0,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    priceController.dispose();
    descriptionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void startScaleAnimation() {
    _scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Select Horse to Sell"),
      ),
      body: selectedHorse == null
          ? ListView.builder(
              itemCount: widget.userHorses.length,
              itemBuilder: (context, index) {
                final horse = widget.userHorses[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: horse['name'],
                        child: Image.network(
                          horse['image'],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      horse['name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text("Default price: \$${horse['price']}"),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.deepOrange),
                    onTap: () {
                      setState(() {
                        selectedHorse = Map<String, dynamic>.from(horse);
                        priceController.text = horse['price'].toString();
                        descriptionController.text = horse['description'] ?? '';
                      });
                      startScaleAnimation();
                    },
                  ),
                );
              },
            )
          : ScaleTransition(
              scale: _scaleAnimation,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Hero(
                      tag: selectedHorse!['name'],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          selectedHorse!['image'],
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      selectedHorse!['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Price",
                        prefixText: '\$ ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.publish),
                      label: const Text("Publish for Sale",
                          style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 8,
                        shadowColor: Colors.deepOrangeAccent,
                      ),
                      onPressed: () {
                        selectedHorse!['price'] =
                            int.tryParse(priceController.text) ?? 0;
                        selectedHorse!['description'] =
                            descriptionController.text;

                        Navigator.pop(context, selectedHorse);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      icon: const Icon(Icons.arrow_back, color: Colors.deepOrange),
                      label: const Text("Back to list",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      onPressed: () {
                        setState(() {
                          selectedHorse = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class HorseDetailScreen extends StatelessWidget {
  final Map<String, dynamic> horse;
  const HorseDetailScreen({Key? key, required this.horse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(horse['name']),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: horse['name'],
              child: Image.network(
                horse['image'],
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                horse['description'] ?? 'No description provided.',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 24),
                  const SizedBox(width: 8),
                  Text(horse['rating'].toString(),
style: const TextStyle(
fontSize: 20, fontWeight: FontWeight.bold)),
const Spacer(),
Text('\$${horse['price']}',
style: const TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: Colors.deepOrange)),
],
),
),
const SizedBox(height: 30),
],
),
),
);
}
}
