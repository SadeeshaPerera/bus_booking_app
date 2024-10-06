import 'package:flutter/material.dart';
import 'ReportMissingItemsScreen.dart'; // Import the ReportMissingItemsScreen
import 'FindMissingItemsScreen.dart'; // Import the FindMissingItemsScreen

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Blue background for the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the home page
          },
        ),
        title: const Text('Notice Board'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Instructions Box with increased size
            Container(
              width: double.infinity, // Expands to full width
              padding: const EdgeInsets.all(24.0), // Increased padding
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Text(
                    'INSTRUCTIONS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Please note that you are responsible for the accuracy of the information you provide in your notice. '
                    'We are not liable for any delays in locating or returning your items.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // Increase space between box and buttons
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
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(250, 50), // Set equal size for both buttons
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
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(250, 50), // Set equal size for both buttons
              ),
              child: const Text(
                'FIND MISSING ITEMS',
                style: TextStyle(fontSize: 16, color: Colors.white),
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
}