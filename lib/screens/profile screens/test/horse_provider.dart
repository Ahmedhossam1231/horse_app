/*import 'package:flutter/material.dart';
import 'horse_model.dart';

class HorseProvider with ChangeNotifier {
  final List<Horse> _horses = [
    // مثال: حصان جاهز للعرض
    Horse(
      id: 'h1',
      name: 'Star Lightning',
      gender: 'Male',
      birthDate: '2018-05-10',
      breed: 'Arabian',
      color: 'Chestnut',
      owner: 'Ali',
      description: 'A strong and fast Arabian horse.',
      price: 3500.0,
      imageUrl: 'https://images.unsplash.com/photo-1560807707-8cc77767d783?auto=format&fit=crop&w=800&q=80',
    ),
    // ممكن تضيف أحصنة جاهزة هنا
  ];

  List<Horse> get horses => [..._horses];

  void addHorse(Horse horse) {
    _horses.add(horse);
    notifyListeners();
  }

  void updateHorse(String id, Horse newHorse) {
    final index = _horses.indexWhere((h) => h.id == id);
    if (index >= 0) {
      _horses[index] = newHorse;
      notifyListeners();
    }
  }

  void deleteHorse(String id) {
    _horses.removeWhere((h) => h.id == id);
    notifyListeners();
  }
}
*/