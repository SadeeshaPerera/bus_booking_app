import 'package:flutter/material.dart';

class BusTimetableScreen extends StatelessWidget {
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
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://example.com/path/to/profile/image'), // Replace with real image URL
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hey Kamal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Where you want go?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.black54),
                      SizedBox(width: 8),
                      Text(
                        'Your Location',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Spacer(),
                      Icon(Icons.music_note,
                          color: Colors.blue), // Add your music icon here
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.black54),
                      SizedBox(width: 8),
                      Text(
                        'Destination',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      ChoiceChip(label: Text('Today'), selected: true),
                      SizedBox(width: 8),
                      ChoiceChip(label: Text('Tomorrow'), selected: false),
                      SizedBox(width: 8),
                      ChoiceChip(label: Text('Other'), selected: false),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Find Buses'),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  MenuItemWidget(
                    icon: Icons.announcement,
                    title: 'News Alerts',
                    color: Colors.red,
                  ),
                  MenuItemWidget(
                    icon: Icons.monetization_on,
                    title: 'Bus Fares',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set to the active tab
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  MenuItemWidget({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
    );
  }
}
