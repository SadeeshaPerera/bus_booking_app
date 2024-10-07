import 'package:flutter/material.dart';

class NotificationDetail extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  NotificationDetail({
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Detail'),
        backgroundColor: color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(description, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back To Notification'),
              style: ElevatedButton.styleFrom(
                backgroundColor: color, // Use backgroundColor instead of primary
              ),
            ),
          ],
        ),
      ),
    );
  }
}
