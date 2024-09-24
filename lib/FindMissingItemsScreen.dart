import 'package:flutter/material.dart';

class FindMissingItemsScreen extends StatefulWidget {
  const FindMissingItemsScreen({super.key});

  @override
  _FindMissingItemsScreenState createState() => _FindMissingItemsScreenState();
}

class _FindMissingItemsScreenState extends State<FindMissingItemsScreen> {
  String? selectedRoute;
  DateTime? selectedDate;

  final List<String> routes = [
    'Colombo - Kandy',
    'Galle - Colombo',
    'Kandy - Jaffna',
    'Matara - Colombo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text('Missing Items'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/round_dp.png'), // Example image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Select Route and Date Filters
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  // Route Selector Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Route',
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.purple[50],
                    ),
                    value: selectedRoute,
                    items: routes.map((String route) {
                      return DropdownMenuItem<String>(
                        value: route,
                        child: Text(route),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRoute = value;
                      });
                    },
                    icon: const Icon(Icons.directions_bus, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  // Date Selector with Calendar
                  ElevatedButton.icon(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_today, color: Colors.black),
                    label: Text(
                      selectedDate != null
                          ? 'Selected Date: ${selectedDate!.toLocal().toString().split(' ')[0]}'
                          : 'Select date',
                      style: const TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[50],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Search Button
            ElevatedButton(
              onPressed: () {
                // Search Logic
                if (selectedRoute != null && selectedDate != null) {
                  // Implement search logic based on selectedRoute and selectedDate
                } else {
                  // Show error if any field is not selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Please select a route and date'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Search',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            // List of Missing/Found Items (dummy data for now)
            // This will show results based on search logic
          ],
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

  // Date Picker Function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default to today's date
      firstDate: DateTime(2020), // Earliest possible date
      lastDate: DateTime(2030), // Latest possible date
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
