// lib/home.dart
import 'package:bus_booking_app/search_results.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:bus_booking_app/BusTimeTableScreen.dart';
import 'package:bus_booking_app/elevator_screen.dart'; // Ensure this import is present
import 'package:bus_booking_app/notification_panel.dart'; // Add this import

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      }),
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/images/round_dp.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusTimetableScreen()),
                );
              },
              child: Text('Bus Timetable'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchResultsScreen()),
                );
              },
              child: Text('Bus Search Results'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ElevatorScreen()), // This should work now
                );
              },
              child: Text('Go to Elevator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPanelScreen()), // This should work now
                );
              },
              child: Text('Go to Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
