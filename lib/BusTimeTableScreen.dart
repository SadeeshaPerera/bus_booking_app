import 'package:flutter/material.dart';
import 'notification_panel_screen.dart'; // Import the NotificationPanelScreen

class BusTimetableScreen extends StatelessWidget {
  const BusTimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0, // Hide the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/round_dp.png'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Hey Kamal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Where you want go?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.black54),
                      const SizedBox(width: 8),
                      const Text(
                        'Your Location',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const Spacer(),
                      const Icon(Icons.music_note,
                          color: Colors.blue), // Add your music icon here
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_pin, color: Colors.black54),
                      const SizedBox(width: 8),
                      const Text(
                        'Destination',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const ChoiceChip(label: Text('Today'), selected: true),
                      const SizedBox(width: 8),
                      const ChoiceChip(
                          label: Text('Tomorrow'), selected: false),
                      const SizedBox(width: 8),
                      const ChoiceChip(label: Text('Other'), selected: false),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Find Buses',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  MenuItemWidget(
                    icon: Icons.announcement,
                    title: 'News Alerts',
                    color: Colors.red,
                    onTap: () {
                      // Navigate to NotificationPanelScreen when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationPanelScreen(),
                        ),
                      );
                    },
                  ),
                  MenuItemWidget(
                    icon: Icons.monetization_on,
                    title: 'Bus Fares',
                    color: Colors.orange,
                    onTap: () {
                      // No navigation for now
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set to the active tab
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

// Define MenuItemWidget here for simple and reusable widgets
class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap; // Add onTap for navigation

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap, // Add onTap for handling tap events
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap, // Trigger the onTap when the widget is tapped
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(icon, color: color),
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
