import 'package:bus_booking_app/FindMissingItemsScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:image_picker/image_picker.dart'; // For image picker
import 'dart:io'; // For File
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firestore
import 'package:firebase_storage/firebase_storage.dart'; // For Firebase Storage

class ReportMissingItemsScreen extends StatefulWidget {
  const ReportMissingItemsScreen({super.key});

  @override
  _ReportMissingItemsScreenState createState() => _ReportMissingItemsScreenState();
}

class _ReportMissingItemsScreenState extends State<ReportMissingItemsScreen> {
  String? selectedRoute;
  DateTime? selectedDate;
  bool isFound = false; // For found checkbox state
  bool isMissing = false; // For missing checkbox state

  File? _selectedImage; // Store the selected image
  final TextEditingController _descriptionController = TextEditingController(); // Controller for description

  // List of routes (dummy data)
  final List<String> routes = [
    'Colombo - Kandy',
    'Galle - Colombo',
    'Kandy - Jaffna',
    'Matara - Colombo'
  ];

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

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    } else {
      print("No image selected."); // Debugging line
    }
  }

  // Function to upload the image to Firebase Storage
  Future<String?> _uploadImage() async {
    if (_selectedImage != null) {
      final storageRef = FirebaseStorage.instance.ref();
      final fileName = 'missing_items/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final imageRef = storageRef.child(fileName);

      try {
        await imageRef.putFile(_selectedImage!);
        String downloadUrl = await imageRef.getDownloadURL();
        print("Image uploaded successfully: $downloadUrl"); // Debugging line
        return downloadUrl; // Return the valid URL
      } catch (e) {
        print("Error uploading image: $e"); // Debugging line
        return null; // Return null on error
      }
    }
    print("No image selected for upload."); // Debugging line
    return null; // Return null if no image is selected
  }

  // Function to submit report to Firestore
  Future<void> _submitReport() async {
    if (selectedRoute != null && selectedDate != null && _descriptionController.text.isNotEmpty && _selectedImage != null) {
      
      // Call _uploadImage and wait for it to complete
      String? imageUrl = await _uploadImage();
      
      Map<String, dynamic> reportData = {
        'route': selectedRoute,
        'date': selectedDate,
        'description': _descriptionController.text,
        'isFound': isFound,
        'isMissing': isMissing,
        'imageUrl': imageUrl, 
      };

      try {
        await FirebaseFirestore.instance.collection('missing_items_reports').add(reportData);
        
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text('Report submitted successfully!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    // Navigate to the next screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const FindMissingItemsScreen()),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );

        _clearForm();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error submitting report!')),
        );
      }
    } else {
      // Show error message if any fields are empty, including image not being selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_selectedImage == null ? 'Please upload an image!' : 'Please fill in all fields!')),
      );
    }
  }

  // Function to clear form fields
  void _clearForm() {
    setState(() {
      selectedRoute = null;
      selectedDate = null;
      _descriptionController.clear();
      _selectedImage = null;
      isFound = false;
      isMissing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // Adjust height as needed
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)), // Rounded corners
          child: AppBar(
            backgroundColor: Color(0xFF4A43EC), // Blue background for the AppBar
            foregroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0), // Adjust left and top padding for the back button
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0), // Adjust top padding for the title
              child: const Text(
                'Report Missing Items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ), 
              ),
            ),
            centerTitle: true, // Center the title
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 20.0), // Adjust right and top padding for the avatar
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/round_dp.png'), // Profile image
                ),
              ),
            ],
          ),
        ),
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
                  fillColor: Colors.grey.shade200, // Changed to grey background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.directions_bus, color: Color.fromARGB(255, 15, 15, 15)), // Bus icon added
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // Changed to grey background
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 26, 25, 25)), // Added border
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Color.fromARGB(255, 15, 15, 15)),
                      const SizedBox(width: 8),
                      Text(
                        selectedDate != null
                            ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                            : 'Select date',
                        style: const TextStyle(
                            fontSize: 16, color: Color.fromARGB(255, 7, 7, 7)),
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
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Enter description of the missing item',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Upload a image',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 180, // Adjust width as needed
                      height: 60, // Adjust height as needed
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_upload, color: Colors.black, size: 30.0), // Upload icon
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: _pickImage, // Function to select image
                            child: const Text('Upload Image'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8), // Space between container and message
                    _selectedImage == null
                        ? const Text('No chosen file', style: TextStyle(color: Colors.grey)) // Display message if no image
                        : Container(), // Display nothing if image is selected
                  ],
                ),
                if (_selectedImage != null) ...[
                  const SizedBox(height: 16), // Space between upload section and image
                  Image.file(
                    _selectedImage!, // Display the selected image
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isFound,
                        onChanged: (bool? value) {
                          setState(() {
                            isFound = value ?? false;
                            if (isFound) {
                              isMissing = false; // Uncheck 'Missing' if 'Found' is checked
                            }
                          });
                        },
                      ),
                      const Text('Found'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isMissing,
                        onChanged: (bool? value) {
                          setState(() {
                            isMissing = value ?? false;
                            if (isMissing) {
                              isFound = false; // Uncheck 'Found' if 'Missing' is checked
                            }
                          });
                        },
                      ),
                      const Text('Missing'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _submitReport, // Submit the report
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5669FF), // Set the button color
                    foregroundColor: Colors.white,
                    minimumSize: const Size(180, 50), 
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set active tab
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