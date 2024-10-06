import 'package:flutter/material.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/pages/date_pick_page.dart';

class SampleRoutePage extends StatelessWidget {
  final DateTime routeDepartureTime = DateTime(2024, 9, 26, 10, 30); // Example departure time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to DatePickerPage and pass the routeDepartureTime
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DatePickerPage(routeDepartureTime: routeDepartureTime),
              ),
            );
          },
          child: Text('Choose Date'),
        ),
      ),
    );
  }
}
