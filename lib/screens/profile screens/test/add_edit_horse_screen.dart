/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'horse_model.dart';
import 'horse_provider.dart';
import 'package:uuid/uuid.dart';

class AddEditHorseScreen extends StatefulWidget {
  final Horse? horse;
  const AddEditHorseScreen({Key? key, this.horse}) : super(key: key);

  @override
  State<AddEditHorseScreen> createState() => _AddEditHorseScreenState();
}

class _AddEditHorseScreenState extends State<AddEditHorseScreen> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String gender;
  late String birthDate;
  late String breed;
  late String color;
  late String owner;
  late String description;
  late String imageUrl;
  late double price;

  @override
  void initState() {
    super.initState();
    final h = widget.horse;
    name = h?.name ?? '';
    gender = h?.gender ?? '';
    birthDate = h?.birthDate ?? '';
    breed = h?.breed ?? '';
    color = h?.color ?? '';
    owner = h?.owner ?? '';
    description = h?.description ?? '';
    imageUrl = h?.imageUrl ?? 'https://images.unsplash.com/photo-1560807707-8cc77767d783?auto=format&fit=crop&w=800&q=80';
    price = h?.price ?? 0.0;
  }

  void saveForm() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    final newHorse = Horse(
      id: widget.horse?.id ?? const Uuid().v4(),
      name: name,
      gender: gender,
      birthDate: birthDate,
      breed: breed,
      color: color,
      owner: owner,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );

    final horseProvider = Provider.of<HorseProvider>(context, listen: false);

    if (widget.horse == null) {
      horseProvider.addHorse(newHorse);
    } else {
      horseProvider.updateHorse(newHorse.id, newHorse);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.horse == null ? 'Add New Horse' : 'Edit Horse'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField('Name', initialValue: name, onSaved: (v) => name = v!, validator: _notEmptyValidator),
              buildTextField('Gender', initialValue: gender, onSaved: (v) => gender = v!, validator: _notEmptyValidator),
              buildTextField('Birth Date', initialValue: birthDate, onSaved: (v) => birthDate = v!),
              buildTextField('Breed', initialValue: breed, onSaved: (v) => breed = v!),
              buildTextField('Color', initialValue: color, onSaved: (v) => color = v!),
              buildTextField('Owner', initialValue: owner, onSaved: (v) => owner = v!),
              buildTextField('Description', initialValue: description, onSaved: (v) => description = v!),
              buildTextField('Image URL', initialValue: imageUrl, onSaved: (v) => imageUrl = v!),
              buildTextField(
                'Price',
                initialValue: price > 0 ? price.toString() : '',
                keyboardType: TextInputType.number,
                onSaved: (v) => price = double.tryParse(v ?? '0') ?? 0,
                validator: _priceValidator,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: saveForm,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                child: const Text('Save', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _notEmptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  String? _priceValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Price is required';
    final p = double.tryParse(value);
    if (p == null || p <= 0) return 'Enter a valid price > 0';
    return null;
  }

  Widget buildTextField(String label, {String? initialValue, required FormFieldSetter<String> onSaved, FormFieldValidator<String>? validator, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: initialValue,
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
*/