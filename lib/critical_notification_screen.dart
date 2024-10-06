import 'package:flutter/material.dart';
import 'notification_detail_screen.dart';


class CriticalNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Critical Notifications'),
        backgroundColor: Colors.red, // Use a red color to signify criticality
      ),
      body: ListView(
        children: [
          NotificationCard(
            title: 'Bus Accident on Route 22B',
            description: 'A severe accident occurred near the main highway. Expect delays.',
            time: '1 hour ago',
            imagePath: 'assets/images/accident.jpg', // Replace with your image path
            onTap: () {
              // Navigate to detail screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationDetailScreen(
                    title: 'Bus Accident on Route 22B',
                    description: 'A severe accident occurred near the main highway. Expect delays.',
                    imagePath: 'assets/images/accident.jpg',
                  ),
                ),
              );
            },
          ),
          // Add more critical notifications as needed
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String imagePath;
  final VoidCallback onTap;

  NotificationCard({
    required this.title,
    required this.description,
    required this.time,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.warning, color: Colors.red), // Warning icon
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(time),
        onTap: onTap,
      ),
    );
  }
}

