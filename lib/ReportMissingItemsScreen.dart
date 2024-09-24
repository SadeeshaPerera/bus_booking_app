import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:image_picker/image_picker.dart'; // For image picker
import 'dart:io'; // For File

class ReportMissingItemsScreen extends StatefulWidget {
  const ReportMissingItemsScreen({super.key});

  @override
  _ReportMissingItemsScreenState createState() =>
      _ReportMissingItemsScreenState();
}

class _ReportMissingItemsScreenState extends State<ReportMissingItemsScreen> {
  String? selectedRoute;
  DateTime? selectedDate;
  bool isFound = false; // For checkbox state
  bool isMissing = true;

  File? _selectedImage; // Store the selected image

  // List of routes (dummy data)
  final List<String> routes = ['Route 1', 'Route 2', 'Route 3', 'Route 4'];

  final ImagePicker _picker = ImagePicker(); // Initialize image picker

  // Function to open date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Blue background for the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text('Report Missing Items'),
        centerTitle: true, // Center the title
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/round_dp.png'), // Profile image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  filled: true,
                  fillColor: Colors.purple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                hint: const Text('Select route'),
                value: selectedRoute,
                items: routes.map<DropdownMenuItem<String>>((String route) {
                  return DropdownMenuItem<String>(
                    value: route,
                    child: Text(route),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRoute = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _selectDate(context); // Open date picker
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50, // Light purple background
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.purple),
                      const SizedBox(width: 12),
                      Text(
                        selectedDate != null
                            ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                            : 'Select date',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter description',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Upload a picture',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickImage, // Call _pickImage when tapped
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      if (_selectedImage != null)
                        Image.file(
                          _selectedImage!,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.cloud_upload, color: Colors.black54),
                            SizedBox(width: 8),
                            Text(
                              'Click here to upload an image',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: isFound, // Bound to isFound state
                    onChanged: (bool? value) {
                      setState(() {
                        isFound = value!;
                        isMissing = !value; // Ensure only one is selected
                      });
                    },
                  ),
                  const Text('Found'),
                  const SizedBox(width: 16),
                  Checkbox(
                    value: isMissing, // Bound to isMissing state
                    onChanged: (bool? value) {
                      setState(() {
                        isMissing = value!;
                        isFound = !value; // Ensure only one is selected
                      });
                    },
                  ),
                  const Text('Missing'),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Submit action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set the active tab to "Help"
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); // Go back to home
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_outlined),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_outlined),
            label: 'Help',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
