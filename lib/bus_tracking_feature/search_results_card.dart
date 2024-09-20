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
  final String busNo;
  final String airConditionType;
  final String busArrivalTime;

  const BusTicketCard({
    super.key,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.startLocation,
    required this.endLocation,
    required this.tripType,
    required this.price,
    required this.seatsLeft,
    required this.busNo,
    required this.airConditionType,
    required this.busArrivalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 22.0, // Half of the desired height (44 / 2)
                  backgroundColor: Color(0xFFEAEBFC),
                  child: Icon(
                    Icons.directions_bus,
                    size: 30.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      busNo,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16.0, // Adjust the size as needed
                          color: Colors.black,
                        ),
                        const SizedBox(
                            width:
                                4.0), // Add some space between the icon and the text
                        Text(
                          '$busArrivalTime',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child:
                      Container(), // This empty container will take up the remaining space
                ),
                Text(
                  '$seatsLeft Seat(s) left',
                  style: const TextStyle(
                    color: Color(0xFFF0635A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(departureTime,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(startLocation),
                  ],
                ),
                Column(
                  children: [
                    Text(duration),
                    const Row(
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
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(endLocation),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.directions, // Choose an appropriate icon
                      size: 16.0, // Adjust the size as needed
                      color: Colors.black,
                    ),
                    const SizedBox(
                        width:
                            4.0), // Add some space between the icon and the text
                    Text(
                      tripType,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child:
                      Container(), // This empty container will take up the remaining space
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          title: const Text('Bus Ticket Booking'),
        ),
        body: ListView(
          children: const [
            BusTicketCard(
              departureTime: '5:31 AM',
              arrivalTime: '7:23 AM',
              duration: '1h 52m',
              startLocation: 'Colombo Fort',
              endLocation: 'Galanigama',
              tripType: '1 - One way',
              price: 'LKR 250',
              seatsLeft: '2 Seat left',
              busNo: 'NA-1345',
              airConditionType: 'AC',
              busArrivalTime: '7:00 AM',
            ),
            // Add more BusTicketCard widgets here
          ],
        ),
      ),
    );
  }
}
