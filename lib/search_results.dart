import 'package:flutter/material.dart';
import 'search_results_card.dart'; // Import the BusTicketCard widget

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          margin: const EdgeInsets.all(8.0), // Add margin here
          child: AppBar(
            backgroundColor: Colors.blue[900],
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text('Colombo Fort',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                      overflow: TextOverflow.ellipsis),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18.0,
                ),
                Text(
                  'Galanigama',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            centerTitle: true,
          ),
        ),
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
