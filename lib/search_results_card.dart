import 'package:flutter/material.dart';

class BusTicketCard extends StatelessWidget {
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String startLocation;
  final String endLocation;
  final String tripType;
  final String price;
  final String seatsLeft;

  BusTicketCard({
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.startLocation,
    required this.endLocation,
    required this.tripType,
    required this.price,
    required this.seatsLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.directions_bus, size: 30.0),
                Text(
                  seatsLeft,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(departureTime,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(startLocation),
                  ],
                ),
                Column(
                  children: [
                    Text(duration),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 5.0),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 5.0),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 5.0),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(arrivalTime,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(endLocation),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(tripType),
            SizedBox(height: 10),
            Text(price,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Ticket Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bus Ticket Booking'),
        ),
        body: ListView(
          children: [
            BusTicketCard(
              departureTime: '5:31 AM',
              arrivalTime: '7:23 AM',
              duration: '1h 52m',
              startLocation: 'Colombo Fort',
              endLocation: 'Galanigama',
              tripType: '1 - One way',
              price: 'LKR 250',
              seatsLeft: '2 Seat left',
            ),
            // Add more BusTicketCard widgets here
          ],
        ),
      ),
    );
  }
}
