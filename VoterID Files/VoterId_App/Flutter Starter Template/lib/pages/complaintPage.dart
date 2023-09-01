import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const ComplaintPage());
}

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complaint Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ComplaintForm(),
    );
  }
}

class ComplaintForm extends StatefulWidget {
  const ComplaintForm({Key? key}) : super(key: key);

  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  List<Complaint> complaints = [];

  final TextEditingController voterIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  final TextEditingController complaintController = TextEditingController();

  String? _selectedImagePath;

  bool _isEditMode = true;

  String submitMessage = '';

  void submitComplaint() {
    setState(() {
      complaints.add(
        Complaint(
          name: nameController.text,
          mobileNumber: mobileNumberController.text,
          voterId: voterIdController.text,
          complaint: complaintController.text,
          dateTime: DateTime.now(),
          imagePath: _selectedImagePath,
        ),
      );
      nameController.clear();
      mobileNumberController.clear();
      voterIdController.clear();
      complaintController.clear();
      submitMessage = 'Complaint submitted successfully!';
      _selectedImagePath = null; // Reset the selected image path
    });
  }

  void deleteComplaint(int index) {
    setState(() {
      complaints.removeAt(index);
    });
  }

  void editComplaint(int index) {
    setState(() {
      voterIdController.text = complaints[index].voterId;
      nameController.text = complaints[index].name;
      mobileNumberController.text = complaints[index].mobileNumber;

      complaintController.text = complaints[index].complaint;
      complaints.removeAt(index);
    });
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Handles the back button press
            },
          ),
          title: Text('Complaints'), // Add a title for the app bar
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
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Voter ID',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: voterIdController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Mobile Number',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: mobileNumberController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Complaint',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                TextField(
                  controller: complaintController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (_isEditMode)
                  ElevatedButton(
                    onPressed: _selectImage,
                    child: const Text('Add Image'),
                  ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: submitComplaint,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 8.0),
                Text(
                  submitMessage,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18.0),
                SizedBox(
                  height: 250.0, // Set a fixed height
                  child: ListView.builder(
                    itemCount: complaints.length,
                    itemBuilder: (context, index) {
                      final complaint = complaints[index];
                      return Card(
                        elevation: 2.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 4.0,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Voter ID: ${complaint.voterId}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                'Name: ${complaint.name}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'Mobile Number: ${complaint.mobileNumber}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                'Date & Time: ${complaint.dateTime}',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Complaint: ${complaint.complaint}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (complaint.imagePath != null) ...[
                                const SizedBox(height: 8.0),
                                Container(
                                  height: 150.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image:
                                          FileImage(File(complaint.imagePath!)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Container(
                                            width: double.infinity,
                                            height: 500.0,
                                            child: Image.file(
                                              File(complaint.imagePath!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('View Image'),
                                ),
                              ],
                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => deleteComplaint(index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => editComplaint(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Complaint {
  final String voterId;
  final String name;
  final String mobileNumber;
  final String complaint;
  final DateTime dateTime;
  final String? imagePath;

  Complaint({
    required this.voterId,
    required this.name,
    required this.mobileNumber,
    required this.complaint,
    required this.dateTime,
    this.imagePath,
  });
}
