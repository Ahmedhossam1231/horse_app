import 'package:flutter/material.dart';

class FamilyTreeEntryScreen extends StatefulWidget {
  final String parentName;
  final int generation;

  const FamilyTreeEntryScreen({
    Key? key,
    required this.parentName,
    required this.generation,
  }) : super(key: key);

  @override
  _FamilyTreeEntryScreenState createState() => _FamilyTreeEntryScreenState();
}

class _FamilyTreeEntryScreenState extends State<FamilyTreeEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _motherController = TextEditingController();
  final TextEditingController _age2 = TextEditingController();
  final TextEditingController _relationController = TextEditingController();

  @override
  void dispose() {
    _fatherController.dispose();
    _age.dispose();
    _motherController.dispose();
    _age2.dispose();
    _relationController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black87),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter data for ${widget.parentName} (Gen ${widget.generation})",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 163, 166, 173),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
                shadowColor: Colors.grey.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _fatherController,
                        decoration: _inputDecoration("Father's Name"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter father\'s name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _age,
                        decoration: _inputDecoration("Father's Age"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter father\'s age';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _motherController,
                        decoration: _inputDecoration("Mother's Name"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter mother\'s name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _age2,
                        decoration: _inputDecoration("Mother's Age"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter mother\'s age';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _relationController,
                        decoration: _inputDecoration("Relation to Parent"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the relation';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 163, 166, 173),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context, {
                                'father': _fatherController.text.trim(),
                                'father age': _age.text.trim(),
                                'mother': _motherController.text.trim(),
                                'mother age': _age2.text.trim(),
                                'relation': _relationController.text.trim(),
                              });
                            }
                          },
                          child: const Text(
                            'Save Data',
                            style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
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
