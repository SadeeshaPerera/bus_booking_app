import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore for fetching data
import 'package:intl/intl.dart'; // For date formatting
import 'MissingItemDetailScreen.dart'; // Import the detail screen

class FindMissingItemsScreen extends StatefulWidget {
  const FindMissingItemsScreen({Key? key}) : super(key: key);

  @override
  _FindMissingItemsScreenState createState() => _FindMissingItemsScreenState();
}

class _FindMissingItemsScreenState extends State<FindMissingItemsScreen> {
  final TextEditingController _routeController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedRoute; // Variable to store selected route

  // List of available routes
  final List<String> _routes = [
    'Colombo - Kandy',
    'Galle - Colombo',
    'Kandy - Jaffna',
    'Matara - Colombo',
  ];

  // Function to fetch the missing items reports based on filters
  Stream<QuerySnapshot> _fetchMissingItems() {
    Query query = FirebaseFirestore.instance.collection('missing_items_reports');

    // Filter by route if provided
    if (_selectedRoute != null && _selectedRoute!.isNotEmpty) {
      query = query.where('route', isEqualTo: _selectedRoute);
    }

    // Filter by date if selected
    if (_selectedDate != null) {
      query = query.where('date', isEqualTo: Timestamp.fromDate(_selectedDate!));
    }

    return query.snapshots();
  }

  // Function to open date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A43EC), // Blue background for the AppBar
        foregroundColor: Colors.white,
        title: const Text('Missing Items'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input fields for filtering
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Dropdown for route selection
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.directions_bus, size: 24, color: Colors.black),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Text('  Select Route'),
                          value: _selectedRoute,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedRoute = newValue; // Update selected route
                            });
                          },
                          items: _routes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // Date picker button
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 22, color: Colors.black),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextButton(
                          onPressed: () => _selectDate(context),
                          child: Row(
                            children: [
                              Text(
                                _selectedDate != null
                                    ? 'Selected Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}'
                                    : 'Select Date',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Search button
          ElevatedButton(
            onPressed: () {
              setState(() {}); // Refresh the StreamBuilder to apply filters
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5669FF), // Set the button color to blue
              foregroundColor: Colors.white, // Set text color to white
            ),
            child: const Text('Search'),
          ),

          // StreamBuilder to display the missing items
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _fetchMissingItems(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator()); // Show loading indicator
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No missing items found'),
                  ); // Show message when no data is available
                }

                // Get the documents from the Firestore collection
                final List<DocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;

                    // Get the values from Firestore fields
                    String route = data['route'] ?? 'Unknown route';
                    DateTime date = (data['date'] as Timestamp).toDate();
                    String description = data['description'] ?? 'No description';
                    String imageUrl = data['imageUrl'] ?? '';
                    bool isFound = data['isFound'] ?? false;

                    return GestureDetector(
                      onTap: () {
                        // Navigate to the MissingItemDetailScreen, passing date and isFound as well
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MissingItemDetailScreen(
                              item: {
                                'title': route,
                                'details': description,
                                'imageUrl': imageUrl, // Pass image URL to detail screen
                                'date': DateFormat('dd/MM/yyyy').format(date), // Pass the formatted date
                                'isFound': isFound ? 'Found' : 'Missing', // Pass the isFound status as string
                              },
                            ),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 5,
                        color: Color.fromARGB(255, 252, 252, 253), 
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Display image if available
                              if (imageUrl.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    imageUrl,
                                    height: 150, // Adjust height as needed
                                    width: 125, // Set width for image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              const SizedBox(width: 16), // Space between image and text

                              // Details on the right side
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Route name
                                    Text(
                                      route,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Status (Found/Missing)
                                    Row(
                                      children: [
                                        Text(
                                          isFound ? 'Found' : 'Missing',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: isFound ? Colors.orange : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Date
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                                        const SizedBox(width: 8),
                                        Text(
                                          DateFormat('dd/MM/yyyy').format(date),
                                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),

                                    // Description with ellipsis
                                    Text(
                                      description,
                                      maxLines: 2, // Limit to 2 lines
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 8),

                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
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
