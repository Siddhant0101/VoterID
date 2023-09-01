import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VoterRegistrationPage extends StatefulWidget {
  const VoterRegistrationPage({super.key});

  @override
  _VoterRegistrationPageState createState() => _VoterRegistrationPageState();
}

class _VoterRegistrationPageState extends State<VoterRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _name;
  String? _fatherName;
  String? _sex;
  DateTime? _dateOfBirth;
  String? _address;
  DateTime? _dateOfApply;

  String? _selectedImagePath;

  bool _isEditMode = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isEditMode = false;
      });

      // Process the form data or make API calls

      // Example: Print the form data
      print('Name: $_name');
      print('Father\'s Name: $_fatherName');
      print('Sex: $_sex');
      print('Date of Birth: $_dateOfBirth');
      print('Address: $_address');
      print('Date of Apply: $_dateOfApply');
      print('Selected Image Path: $_selectedImagePath');

      // Show a success message or navigate to a success page
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Form submitted successfully.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _selectImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource
          .gallery, // Default to gallery, can change to ImageSource.camera
    );

    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text(
            'Voter Registration',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFFF9933)
                      .withOpacity(0.7), // Saffron with opacity
                  const Color(0xFFFFFFFF)
                      .withOpacity(0.7), // White with opacity
                  const Color(0xFF128807)
                      .withOpacity(0.7), // Green with opacity
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 0.5, 0.9],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        45.0), // Increase padding to increase size
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            if (_selectedImagePath != null)
                              Image.file(
                                File(_selectedImagePath!),
                                height: 120,
                                width: 120,
                              ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Electoral\'s Name',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  _isEditMode
                                      ? TextFormField(
                                          initialValue: _name,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter your name',
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your name';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _name = value;
                                          },
                                        )
                                      : Text(
                                          _name ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Father\'s Name',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  _isEditMode
                                      ? TextFormField(
                                          initialValue: _fatherName,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText:
                                                'Enter your father\'s name',
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your father\'s name';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _fatherName = value;
                                          },
                                        )
                                      : Text(
                                          _fatherName ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Address',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  _isEditMode
                                      ? TextFormField(
                                          initialValue: _address,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter your address',
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your address';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _address = value;
                                          },
                                        )
                                      : Text(
                                          _address ?? '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        const Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Sex',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: _isEditMode
                                  ? DropdownButtonFormField<String>(
                                      value: _sex,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                      ),
                                      items: ['Male', 'Female']
                                          .map(
                                              (sex) => DropdownMenuItem<String>(
                                                    value: sex,
                                                    child: Text(sex),
                                                  ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please select your sex';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _sex = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        _sex = value;
                                      },
                                    )
                                  : Text(
                                      _sex ?? '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Birth Date',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: _isEditMode
                                  ? ElevatedButton(
                                      onPressed: () async {
                                        final DateTime? selectedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate:
                                              _dateOfBirth ?? DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now(),
                                        );

                                        if (selectedDate != null) {
                                          setState(() {
                                            _dateOfBirth = selectedDate;
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 24,
                                        ),
                                        backgroundColor: Colors.blueGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        _dateOfBirth != null
                                            ? _dateOfBirth!
                                                .toString()
                                                .split(' ')[0]
                                            : 'Select Date',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    )
                                  : Text(
                                      _dateOfBirth != null
                                          ? ': ${_dateOfBirth!.toString().split(' ')[0]}'
                                          : '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        const Text(
                          'Additional Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Date of Apply',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 2,
                              child: _isEditMode
                                  ? ElevatedButton(
                                      onPressed: () async {
                                        final DateTime? selectedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate:
                                              _dateOfApply ?? DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now(),
                                        );

                                        if (selectedDate != null) {
                                          setState(() {
                                            _dateOfApply = selectedDate;
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 24,
                                        ),
                                        backgroundColor: Colors.blueGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        _dateOfApply != null
                                            ? _dateOfApply!
                                                .toString()
                                                .split(' ')[0]
                                            : 'Select Date',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    )
                                  : Text(
                                      _dateOfApply != null
                                          ? ': ${_dateOfApply!.toString().split(' ')[0]}'
                                          : '',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (_isEditMode)
                          ElevatedButton(
                            onPressed: _selectImage,
                            child: const Text('Add Image'),
                          ),
                        const SizedBox(height: 16),
                        if (_isEditMode)
                          ElevatedButton(
                            onPressed: _submitForm,
                            child: const Text('Submit'),
                          ),
                        if (!_isEditMode)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isEditMode = true;
                              });
                            },
                            child: const Text('Edit Details'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voter Registration App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
          ),
        ),
      ),
      home: const VoterRegistrationPage(),
    );
  }
}
