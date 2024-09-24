import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String title; // Notification title
  final String description; // Notification description
  final String imagePath; // Path to the notification image

  NotificationDetailScreen({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Detail'), // Set the title here
        backgroundColor: Colors.blue[900], // Match the color of the notification panel
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(imagePath), // Display the notification image
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(description),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to notification screen
                },
                child: Text('Back to Notifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
