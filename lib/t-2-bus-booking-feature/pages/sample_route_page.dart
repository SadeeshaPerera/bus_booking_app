import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/pages/date_pick_page.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/models/scheduleroute.dart'; // Import your model class

class ScheduleRoutePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Route'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('ScheduleRoute').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final busSchedules = snapshot.data!.docs.map((doc) {
            final schedule = ScheduleRoute.fromFirestore(doc);
            schedule.routeId = doc.id; // Assigning the auto-generated document ID as routeId
            return schedule;
          }).toList();

          if (busSchedules.isEmpty) {
            return Center(child: Text('No bus schedules available'));
          }

          return ListView.builder(
            itemCount: busSchedules.length,
            itemBuilder: (context, index) {
              final schedule = busSchedules[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text('${schedule.departureLocation} - ${schedule.destinationLocation}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Departure: ${schedule.departureTime}'),
                      Text('Arrival: ${schedule.destinationTime}'),
                      Text('Price: LKR ${schedule.seatPrice?.toStringAsFixed(2)}'),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 16),
                          Text(' Duration: ${schedule.journeyDuration}', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to DatePickerPage and pass the seatPrice and routeId
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DatePickerPage(
                          seatPrice: schedule.seatPrice ?? 0.0, // Pass the seatPrice
                          routeId: schedule.routeId ?? '', // Pass the routeId
                          ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
