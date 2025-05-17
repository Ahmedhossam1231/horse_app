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
  TextEditingController _fatherController = TextEditingController();
  TextEditingController _age = TextEditingController();

  TextEditingController _motherController = TextEditingController();

  TextEditingController _age2 = TextEditingController();
  TextEditingController _relationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Enter Data for ${widget.parentName} (Generation ${widget.generation})"),
        backgroundColor:               const Color.fromARGB(255, 163, 166, 173),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fatherController,
                      decoration: InputDecoration(labelText: "Father's Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter father\'s name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _age,
                      decoration: InputDecoration(labelText: "age"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Father age';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _motherController,
                      decoration: InputDecoration(labelText: "Mother's Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mother\'s name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _age2,
                      decoration: InputDecoration(labelText: " age"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mother age';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _relationController,
                      decoration:
                          InputDecoration(labelText: "Relation to Parent"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the relation';
                        }
                        return null;
                      },
                    ),
                    if (widget.generation > 1) ...[
                      // Only show these fields starting from Generation 2
                    ],
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Save the data and pop the screen
                          Navigator.pop(context, {
                            'father': _fatherController.text,
                            'father age': _age.text,
                            'mother': _motherController.text,
                            'mother age': _age2.text,
                            'relation': _relationController.text,
                          });
                        }
                      },
                      child: Text('Save Data',style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:               const Color.fromARGB(255, 163, 166, 173),

                      ),
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
}
