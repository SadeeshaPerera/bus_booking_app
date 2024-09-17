import 'package:flutter/material.dart';
import 'search_results_card.dart'; // Import the BusTicketCard widget

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            BusTicketCard(
              departureTime: 'defr',
              arrivalTime: 'df',
              duration: 'dsf',
              startLocation: 'dsf',
              endLocation: 'sdf',
              tripType: 'df',
              price: 'casd',
              seatsLeft: '4',
            ), // Add the BusTicketCard widget here
          ],
        ),
      ),
    );
  }
}
