import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colombo Fort to Galgamuwa'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 3, // Number of bus options
        itemBuilder: (context, index) {
          // Placeholder for actual data
          final busData = {
            'departure': '8:30 AM',
            'arrival': '10:00 AM',
            'duration': '1h 30m',
            'type': 'One way',
            'price': 'LKR 250'
          };

          return BusOptionCard(busData);
        },
      ),
    );
  }
}

class BusOptionCard extends StatelessWidget {
  final Map<String, String> data;

  BusOptionCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Departure: ${data['departure']}'),
                Text('Arrival: ${data['arrival']}'),
              ],
            ),
            SizedBox(height: 5),
            Text('Duration: ${data['duration']}'),
            Text('Type: ${data['type']}'),
            Text('Price: ${data['price']}'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Seat left'),
            ),
          ],
        ),
      ),
    );
  }
}
