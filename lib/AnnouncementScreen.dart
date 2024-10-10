import 'package:flutter/material.dart';
import 'ReportMissingItemsScreen.dart'; // Import the ReportMissingItemsScreen
import 'FindMissingItemsScreen.dart'; // Import the FindMissingItemsScreen
import 'bus_tracking_feature/bus_time_table_screen.dart'; // Import the BusTimetableScreen
import 't-2-bus-booking-feature/no_ticket_screen.dart'; // Import the NoTicketsScreen
import 'bus_tracking_feature/popular_routes.dart'; // Import the PopularRouteDetailsScreen

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  int _selectedIndex = 3; // Set active tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusTimetableScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoTicketsScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PopularRouteDetailsScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnnouncementScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Create a rounded AppBar using a Container
          Container(
            height: 120.0,
            decoration: BoxDecoration(
              color: const Color(0xFF4A43EC), // Blue background for the AppBar
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow for AppBar
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the previous page
                    },
                  ),
                  const Text(
                    'Notice Board',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/round_dp.png'), // Profile image
                  ),
                ],
              ),
            ),
          ),
          // Rest of the body content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Instructions Box with increased size
                  Container(
                    width: double.infinity, // Expands to full width
                    height: 350.0,
                    padding: const EdgeInsets.all(30.0), // Increased padding
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 254, 254),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Shadow color
                          offset: const Offset(0, 2), // Offset of the shadow
                          blurRadius: 4, // Blur radius of the shadow
                          spreadRadius: 2, // Spread radius of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'INSTRUCTIONS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Please note that you are responsible for the accuracy of the information you provide in your notice. '
                          'We are not liable for any delays in locating or returning your items.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height: 40), // Increase space between box and buttons
                  // Button for "Report Missing Items" with equal size
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Report Missing Items Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportMissingItemsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF5669FF), // Set the button color
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(
                          250, 50), // Set equal size for both buttons
                    ),
                    child: const Text(
                      'REPORT MISSING ITEMS',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Button for "Find Missing Items" with equal size
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Find Missing Items Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindMissingItemsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF5669FF), // Set the button color
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(
                          250, 50), // Set equal size for both buttons
                    ),
                    child: const Text(
                      'FIND MISSING ITEMS',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set active tab
        onTap: _onItemTapped,
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
