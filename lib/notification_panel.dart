import 'package:flutter/material.dart';
import 'notification_detail_screen.dart';
import 'critical_notification_screen.dart'; // Import the critical notification screen

class NotificationPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                NotificationCard(
                  title: 'Route 15A Delay',
                  subtitle: 'Expect delays near Central Ave. Buses delayed by 20 minutes.',
                  icon: Icons.warning,
                  time: '10 mins ago',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationDetailScreen(
                          title: 'Route 15A Delay',
                          description: 'Expect delays near Central Ave. Buses delayed by 20 minutes.',
                          imagePath: 'assets/images/bus_delay.png',
                        ),
                      ),
                    );
                  },
                ),
                NotificationCard(
                  title: 'Route 22B Accident',
                  subtitle: 'An accident occurred on the main highway.',
                  icon: Icons.error,
                  time: '30 mins ago',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationDetailScreen(
                          title: 'Route 22B Accident',
                          description: 'An accident occurred on the main highway.',
                          imagePath: 'assets/images/accident.jpg',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Red button for critical notifications
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the background color to red
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              onPressed: () {
                // Navigate to the critical notifications page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CriticalNotificationScreen(),
                  ),
                );
              },
              child: Text(
                'Critical Notifications',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String time;
  final VoidCallback onTap;

  NotificationCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(time),
        onTap: onTap,
      ),
    );
  }
}
