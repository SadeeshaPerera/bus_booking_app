import 'package:bus_booking_app/MissingItemDetailScreen.dart';
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

  // Dummy data for missing items
  final List<Map<String, String>> missingItems = [
    {
      'title': 'Blue Backpack',
      'description': 'Lost on Colombo - Kandy route.',
      'date': '2024-09-30',
      'details': 'This blue backpack was left on the bus. It contains books and a laptop charger.',
    },
    {
      'title': 'Black Laptop',
      'description': 'Left behind in bus.',
      'date': '2024-09-29',
      'details': 'A black laptop with a silver logo. Contact us if found.',
    },
    {
      'title': 'White Water Bottle',
      'description': 'Forgotten in the overhead compartment.',
      'date': '2024-09-28',
      'details': 'A stainless steel water bottle with a custom design. Please return if found.',
    },
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
                  // Route Selector Dropdown with Icon Inside Input Field
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Route',
                      prefixIcon: const Icon(Icons.directions_bus, color: Colors.black), // Icon inside input field
                      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
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
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  
                  // Date Selector with Calendar
                  OutlinedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey), // Adding border similar to Dropdown
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.grey[50], // Matching background color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align icon and text to the left
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.black),
                        const SizedBox(width: 8), // Add space between icon and text
                        Text(
                          selectedDate != null
                              ? 'Selected Date: ${selectedDate!.toLocal().toString().split(' ')[0]}'
                              : 'Select date',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
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
            // List of Missing Items
            Expanded(
              child: ListView.builder(
                itemCount: missingItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showDetails(missingItems[index]),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(missingItems[index]['title']!),
                        subtitle: Text(missingItems[index]['description']!),
                        trailing: Text(missingItems[index]['date']!),
                      ),
                    ),
                  );
                },
              ),
            ),
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

  // Show details for the selected item
  void _showDetails(Map<String, String> item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow scrolling for large content
      builder: (context) {
        return MissingItemDetailScreen(item: item);
      },
    );
  }

  // Date Picker Function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
