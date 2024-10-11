import 'package:flutter/material.dart';
import 'add_notification_screen.dart';
import 'notification_panel_screen.dart'; // Import the NotificationPanelScreen to have access to the callback
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class AdminScreen extends StatelessWidget {
  // This callback will be passed to the AddNotificationScreen
  final Function(String, String, String, String) addNotificationCallback;

  AdminScreen({required this.addNotificationCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNotificationScreen(
                        addNotificationCallback: addNotificationCallback, // Pass the callback here
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue[900],
                ),
                child: Text(
                  'Add Notification',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20), // Add spacing between buttons
              ElevatedButton(
                onPressed: () async {
                  // Sign out the user
                  await FirebaseAuth.instance.signOut();
                  // Navigate back to the login page (replace with your actual login page)
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.red, // Red color for the sign-out button
                ),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
