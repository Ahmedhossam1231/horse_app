/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'horse_provider.dart';
//import 'horse_model.dart';
import 'add_edit_horse_screen.dart';

class EcommerceScreen extends StatefulWidget {
  const EcommerceScreen({Key? key}) : super(key: key);

  @override
  State<EcommerceScreen> createState() => _EcommerceScreenState();
}

class _EcommerceScreenState extends State<EcommerceScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Simulate loading for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildShimmerItem() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(width: 80, height: 80, color: Colors.white, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),),
        ),
        title: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(height: 16, width: 120, color: Colors.white, margin: const EdgeInsets.symmetric(vertical: 4)),
        ),
        subtitle: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(height: 14, width: 100, color: Colors.white),
        ),
        trailing: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(height: 16, width: 40, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final horses = Provider.of<HorseProvider>(context).horses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Horse Marketplace'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddEditHorseScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: _isLoading
          ? ListView.builder(
              itemCount: 5,
              itemBuilder: (_, __) => _buildShimmerItem(),
            )
          : horses.isEmpty
              ? Center(
                  child: Text(
                    'No horses available. Add some!',
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                )
              : ListView.builder(
                  itemCount: horses.length,
                  itemBuilder: (ctx, i) {
                    final horse = horses[i];
                    return FadeTransition(
                      opacity: CurvedAnimation(
                        parent: _controller,
                        curve: Interval(i / horses.length, 1.0, curve: Curves.easeIn),
                      ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              horse.imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(horse.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          subtitle: Text('${horse.breed} • ${horse.color}'),
                          trailing: Text('\$${horse.price.toStringAsFixed(2)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple)),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => AddEditHorseScreen(horse: horse),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
*/