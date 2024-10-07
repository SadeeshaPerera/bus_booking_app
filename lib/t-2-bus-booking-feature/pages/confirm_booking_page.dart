import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConfirmBookingPage extends StatelessWidget {
  final List<String> selectedSeats;

  ConfirmBookingPage({required this.selectedSeats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Seats:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (selectedSeats.isNotEmpty)
              Text(
                selectedSeats.join(', '),
                style: TextStyle(fontSize: 18),
              )
            else
              Text(
                'No seats selected.',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
